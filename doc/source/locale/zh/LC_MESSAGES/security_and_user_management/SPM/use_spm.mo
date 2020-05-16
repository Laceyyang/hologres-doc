��    0      �  C         (     )     8     O     ]     r     �     �     �  �   �  R   �     �  e   �  o   Q     �     �  �   �  �   p  �   i  .   �  �   %	  _   �	  �   .
  �   �
  #   w     �     �  /   �  1   �  ?     D   N  F   �  S   �  I   .  K   x  �   �  ^   �  I   �  9   4     n  ;  �  M  �  -        ?  �   [  �   �  �   k  �   �    y     �     �     �     �     �               +  �   8  q   �  *   D  �   o  c   �     W  !   s  �   �    4  M   T  )   �  �   �  H   t  �   �  �   Y  $   �       %     !   1  '   S  3   {  8   �  7   �  G      �   h  �   �  �   p  �   +   �   �   �   X!  (   �!     "  4  1#  ?   f$     �$  T   �$  a   %  ^   y%  ^   �%         "             '   (               ,                             0          )          /              +         %             &              $   -                 
       !                       	         .   *                   #    1. Disable SPM 1.Enable SPM extension 2. Enable SPM 2. Remove User Group 3. Create User 4. Add User To User Group 5. Remove User From User Group 6. Remove user After SPM is disabled, the corresponding user groups won't be deleted. The detailed privileges that the users in the user group have, may reference to the description of SPM function. After SPM is disabled, the user group may be removed by call function spm_cleanup. After SPM is disabled: After enable SPM, the super user may disable the spm later on, based on business requirement changes. By default, SPM is disabled. The super could execute following statement to enable it in the specific database. Disable SPM Examples Given the circumstances that the original database is delete while the user group is not. The super user could execute spm_cleanup from another database. If you are using Postgre SQL user role module and would like to migrate to SPM, in order to better and/or simple user permission management on the database entities, the spm_migrate function can be executed to migrate the existing user role to SPM. In Hologres, user could use Simple Permission Model to manage user role and privileges, besides the traditional Postgre SQL user role model. Migrate the Postgre SQL user role model to SPM Note: After SPM is enabled, the developer user group owns all the entities of all the schema in the current database, regardless when or by whom the entity was created. Notes: Normally, user groups as a convenient way to manage user,  removing are not recommended. Notes: User need ensure no active SQL statement is running when enabling the SPM, otherwise the enable statement may fail and have side effects on the serviceability. Notes：Ensure there is no active statement running on the database before execute the spm_cleanup, otherwise the execution may fail and service may be affected. Only super user may disable the SPM Overview Remarks Scenario 1, Delete user group while keep the DB Scenario 2, Delete user group after DB is dropped The CONECT and TEMPORARY privilege of DB are granted to PUBLIC. The EXECUTE privilege of functions, procedures is granted to PUBLIC. The USAGE and CREATE privilege of PUBLIC schema are granted to PUBLIC. The USAGE privilege of language, data types (include domains) is granted to PUBLIC. The privilege is granted by adding the user into the specific user group. The privilege is revoked by removing the user from the specific user group. The privileges of other entities including table, view, materialized view, table column, sequence, foreign data wrapper, foreign server and schema（except public schema）are not granted to PUBLIC. The super user can execute the following state to remove user group while keep the DB serving. The user can be removed from the current database. Proceed with cautions. The user should be created before granting the privilege. There are two scenarios. There would be numerous Alter Owner operation triggered by migration and PostgreSQL has throttling on such operation. Each smp_migrate may only Alter Owner on no more than max_locks_per_transaction number of entities. Therefore, you my need execute spm_migration multiple times, until all the entities are migrated. There would be numerous Alter Owner operation triggered by removing user group, while PostgreSQL has throttling on such operation. Each spm_cleanup may only Alter Owner on no more than max_locks_per_transaction number of entities. Therefore, you my need execute spm_cleanup multiple times, until all the 4 SPM user group are removed. Use CREATE EXTENSION to enable SPM extension. Use Simple Permission Model admin: The granted privileges on the existing entities are kept, but won't be applied to new entities in the database, going forward. developer: The granted privileges on the existing entities are kept, but won't be applied to new entities in the database, going forward. viewer: The granted privileges on the existing entities are kept, but won't be applied to new entities in the database, going forward. writer: The granted privileges on the existing entities are kept, but won't be applied to new entities in the database, going forward. Project-Id-Version: Hologres
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2020-05-15 15:28+0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
Last-Translator: 
Language-Team: 
X-Generator: Poedit 2.3.1
Language: zh
 1. 关闭简单权限模型 1.开启函数调用 2.开启简单权限模型 2. 清除保留用户组 3.创建用户 4.授权新用户 5.移除用户组 删除用户 关闭简单权限模型之后，对应用户组将不会被删除，对应用户组内用户拥有的权限可以参见简单权限模型函数说明。 关闭简单权限模型后，如果您需要将用户组清除，可以通过调用spm_cleanup函数来实现。 关闭之后，用户组的权限如下： 开启简单权限模型后，Superuser也可以根据业务需要执行spm_disable关闭简单权限模型，在该DB执行语句. 简单权限模型默认不开启，需要Superuser在需要开启的DB下执行语句进行开启. 简单权限模型的关闭 简单权限模型的使用步骤 若由于某种原因，已经将原有DB删除，但用户组并未删除，现需要删除对应用户组，superuser可以在另外的DB执行以下命令. 若在此之前您的DB使用的标准的Postgres授权，DB中有一定数量的对象（表、视图、外表等等），为更好的管理权限需要开启简单权限模型，可以通过调用spm_migrate函数将已有对象迁移至简单权限模型，在该DB执行以下语句. 在Hologres中，您可以使用简单权限模型来管理用户和授权。 Postgres授权迁移至简单权限模型 说明：开启简单权限模型之后，developer用户组拥有DB中所有schema的所有表、类表的权限，不论这个表、类表是何人在何时创建。 说明：通常情况下，为了方便管理不建议删除用户组。 说明：在开启简单权限模型是，需要确保当前DB没有任何SQL正在运行，否则可能会开启失败，并可能对服务产生影响。 说明：在调用spm_cleanup时，请确保该DB上没有SQL正在运行，否则可能会失败，并可能对服务产生影响。 只能由superuser执行关闭操作 背景 关闭简单权限模型注意事项. 场景1：删除用户组保留DB 场景2：先删除DB再删除用户组 DB的CONNECT，TEMPORARY权限将对PUBLIC开放。 functions, procedures的EXECUTE权限将对PUBLIC开放. public schema的USAGE，CREATE权限将对PUBLIC开放. language, data types (include domains)的USAGE权限将对PUBLIC开放. 成功将新用户创建进实例中后，可以在对应的DB内将新用户加入相应的用户组，以完成授权操作。 同时，你也可以将用户某个DB的某个用户组中移除，移除之后，该用户将不具备该用户组具有的权限。 对于其他对象如table、view、materialized view、table column、sequence、foreign data wrapper、foreign server、schema（除public schema）等不会有权限开放给PUBLIC。 若由于某种原因，需要删除DB内的用户组，但同时又希望当前DB可以继续使用，superuser可以按照以下语句操作. 同时，您也可以根据需要对某个用户进行删除，删除用户成功之后，该用户将会从当前实例删除，请谨慎执行该操作。 在为新用户授权之前，首先需要将新用户创建进当前实例中，若是新用户已经被创建进实例，可忽略此步骤. 分以下两种场景来删除用户组. 由于migrate可能涉及到将大量表进行Alter Owner操作，触发PostgreSQL对此操作的限制，spm_migrate每次仅对不超过max_locks_per_transaction的对象进行Change Owner操作。因此，您可能需要执行spm_migrate多次，直到全部对象迁移过来为止。 由于可能涉及到将大量业务表进行Alter Owner操作，而PostgreSQL对此操作有限制，spm_cleanup每次仅对不超过max_locks_per_transaction的对象进行Alter Owner。
因此，您可能需要执行spm_cleanup多次，直到全部对象迁移过来，以及删除四个用户组为止。 在开启SPM前，需要执行将函数调用的开关开启。 简单权限模型的使用 admin：保留对当前已有对象的权限，但对新建数据库对象不生效. developer用户组：保留对当前已有对象的权限，但对新建数据库对象不生效. viewer用户组：保留对当前已有对象的权限，但对新建数据库对象不生效. writer用户组：保留对当前已有对象的权限，但对新建数据库对象不生效. 