<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+8" hasScaleBasedVisibilityFlag="0" maxScale="0" labelsEnabled="0" simplifyDrawingHints="0" simplifyAlgorithm="0" simplifyLocal="1" simplifyMaxScale="1" readOnly="0" version="3.10.6-A Coruña" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions" simplifyDrawingTol="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" enableorderby="0" type="categorizedSymbol" attr="typ" forceraster="0">
    <categories>
      <category value="Andere_Massnahme" render="true" symbol="0" label="Andere Massnahme"/>
      <category value="Einzelbaum" render="true" symbol="1" label="Einzelbaum"/>
    </categories>
    <symbols>
      <symbol force_rhr="0" name="0" clip_to_extent="1" type="marker" alpha="1">
        <layer pass="0" enabled="1" class="SimpleMarker" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,255,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="star"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="no"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="5"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="1" clip_to_extent="1" type="marker" alpha="1">
        <layer pass="0" enabled="1" class="SimpleMarker" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,255,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="no"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol force_rhr="0" name="0" clip_to_extent="1" type="marker" alpha="1">
        <layer pass="0" enabled="1" class="SimpleMarker" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="190,207,80,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <colorramp name="[source]" type="randomcolors"/>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property value="t_id" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="t_id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="t_ili_tid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="typ">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="ilicode" type="QString"/>
            <Option name="Layer" value="oekologie_punkte_29c58875_8f2c_4e84_8978_8a7965b85743" type="QString"/>
            <Option name="LayerName" value="Ökologie Punkte" type="QString"/>
            <Option name="LayerProviderName" value="postgres" type="QString"/>
            <Option name="LayerSource" value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;oekologie_punkte&quot; sql=" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="dispname" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="astatus">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="ilicode" type="QString"/>
            <Option name="Layer" value="astatus_8c9aab94_4b62_4ec0_ae4a_4387a26bd61a" type="QString"/>
            <Option name="LayerName" value="Status" type="QString"/>
            <Option name="LayerProviderName" value="postgres" type="QString"/>
            <Option name="LayerSource" value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;astatus&quot; sql=" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="dispname" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_datum">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="dd.MM.yyyy" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bauabnahme_datum">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="dd.MM.yyyy" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="werksid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="unterhaltsid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="projekt">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option name="AllowAddFeatures" value="false" type="bool"/>
            <Option name="AllowNULL" value="false" type="bool"/>
            <Option name="MapIdentification" value="true" type="bool"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="ReadOnly" value="false" type="bool"/>
            <Option name="Relation" value="raeumlicheelemnte_klg_pnkt_projekt_fkey" type="QString"/>
            <Option name="ShowForm" value="false" type="bool"/>
            <Option name="ShowOpenFormButton" value="true" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="werkeigentum">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option name="AllowAddFeatures" value="true" type="bool"/>
            <Option name="AllowNULL" value="true" type="bool"/>
            <Option name="MapIdentification" value="false" type="bool"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="ReadOnly" value="false" type="bool"/>
            <Option name="Relation" value="raeumlicheelemnte_klg_pnkt_werkeigentum_fkey" type="QString"/>
            <Option name="ShowForm" value="false" type="bool"/>
            <Option name="ShowOpenFormButton" value="true" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="t_id"/>
    <alias index="1" name="" field="t_ili_tid"/>
    <alias index="2" name="Typ" field="typ"/>
    <alias index="3" name="Status" field="astatus"/>
    <alias index="4" name="Status_Datum" field="status_datum"/>
    <alias index="5" name="Datum Bauabnahme" field="bauabnahme_datum"/>
    <alias index="6" name="WerksID" field="werksid"/>
    <alias index="7" name="Genossenschaft" field="unterhaltsid"/>
    <alias index="8" name="Projekt" field="projekt"/>
    <alias index="9" name="Werkeigentum" field="werkeigentum"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="t_id" expression=""/>
    <default applyOnUpdate="0" field="t_ili_tid" expression=""/>
    <default applyOnUpdate="0" field="typ" expression="'Einzelbaum'"/>
    <default applyOnUpdate="0" field="astatus" expression="'projektiert'"/>
    <default applyOnUpdate="0" field="status_datum" expression="format_date(now(), 'yyyy-MM-dd')"/>
    <default applyOnUpdate="0" field="bauabnahme_datum" expression=""/>
    <default applyOnUpdate="0" field="werksid" expression=""/>
    <default applyOnUpdate="0" field="unterhaltsid" expression=""/>
    <default applyOnUpdate="0" field="projekt" expression=""/>
    <default applyOnUpdate="0" field="werkeigentum" expression=""/>
  </defaults>
  <constraints>
    <constraint field="t_id" exp_strength="0" unique_strength="1" notnull_strength="1" constraints="3"/>
    <constraint field="t_ili_tid" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="typ" exp_strength="0" unique_strength="0" notnull_strength="1" constraints="1"/>
    <constraint field="astatus" exp_strength="0" unique_strength="0" notnull_strength="1" constraints="1"/>
    <constraint field="status_datum" exp_strength="1" unique_strength="0" notnull_strength="1" constraints="5"/>
    <constraint field="bauabnahme_datum" exp_strength="1" unique_strength="0" notnull_strength="0" constraints="4"/>
    <constraint field="werksid" exp_strength="1" unique_strength="0" notnull_strength="0" constraints="4"/>
    <constraint field="unterhaltsid" exp_strength="1" unique_strength="0" notnull_strength="0" constraints="4"/>
    <constraint field="projekt" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="werkeigentum" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="t_id" exp="" desc=""/>
    <constraint field="t_ili_tid" exp="" desc=""/>
    <constraint field="typ" exp="" desc=""/>
    <constraint field="astatus" exp="" desc=""/>
    <constraint field="status_datum" exp="status_datum IS NULL or (status_datum >= to_date('1800-01-01') and status_datum &lt;= to_date('2099-12-31'))" desc="Datum Status muss zwischen 1.1.1800 und 31.12.2099 liegen."/>
    <constraint field="bauabnahme_datum" exp="bauabnahme_datum IS NULL or (bauabnahme_datum >= to_date('1800-01-01') and bauabnahme_datum &lt;= to_date('2099-12-31'))" desc="Datum Bauabnahme muss zwischen 1.1.1800 und 31.12.2099 liegen."/>
    <constraint field="werksid" exp="werksid IS NULL OR length(werksid) &lt;= 20" desc="WerksID darf maximal 20 Zeichen lang sein."/>
    <constraint field="unterhaltsid" exp="unterhaltsid IS NULL OR length(unterhaltsid) &lt;= 20" desc="Die UnterhaltsID darf maximal 20 Zeichen lang sein."/>
    <constraint field="projekt" exp="" desc=""/>
    <constraint field="werkeigentum" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column hidden="0" name="t_id" width="-1" type="field"/>
      <column hidden="0" name="t_ili_tid" width="-1" type="field"/>
      <column hidden="0" name="typ" width="-1" type="field"/>
      <column hidden="0" name="astatus" width="-1" type="field"/>
      <column hidden="0" name="status_datum" width="-1" type="field"/>
      <column hidden="0" name="bauabnahme_datum" width="-1" type="field"/>
      <column hidden="0" name="werksid" width="-1" type="field"/>
      <column hidden="0" name="unterhaltsid" width="-1" type="field"/>
      <column hidden="0" name="projekt" width="-1" type="field"/>
      <column hidden="0" name="werkeigentum" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer columnCount="2" visibilityExpressionEnabled="0" name="Ökologie Punkt" groupBox="0" visibilityExpression="" showLabel="1">
      <attributeEditorField index="2" name="typ" showLabel="1"/>
      <attributeEditorField index="5" name="bauabnahme_datum" showLabel="1"/>
      <attributeEditorField index="3" name="astatus" showLabel="1"/>
      <attributeEditorField index="4" name="status_datum" showLabel="1"/>
      <attributeEditorField index="8" name="projekt" showLabel="1"/>
      <attributeEditorField index="6" name="werksid" showLabel="1"/>
      <attributeEditorField index="9" name="werkeigentum" showLabel="1"/>
      <attributeEditorField index="7" name="unterhaltsid" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" name="Genossenschaft" groupBox="0" visibilityExpression="" showLabel="1">
      <attributeEditorRelation name="raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_klg_pnkt_fkey" showUnlinkButton="1" showLinkButton="1" relation="raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_klg_pnkt_fkey" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" visibilityExpressionEnabled="1" name="Debugging" groupBox="0" visibilityExpression="eval(@debugging)" showLabel="1">
      <attributeEditorField index="1" name="t_ili_tid" showLabel="1"/>
      <attributeEditorField index="0" name="t_id" showLabel="1"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="astatus" editable="1"/>
    <field name="bauabnahme_datum" editable="1"/>
    <field name="projekt" editable="1"/>
    <field name="status_datum" editable="1"/>
    <field name="t_id" editable="1"/>
    <field name="t_ili_tid" editable="1"/>
    <field name="typ" editable="1"/>
    <field name="unterhaltsid" editable="1"/>
    <field name="werkeigentum" editable="1"/>
    <field name="werksid" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="astatus" labelOnTop="0"/>
    <field name="bauabnahme_datum" labelOnTop="0"/>
    <field name="projekt" labelOnTop="0"/>
    <field name="status_datum" labelOnTop="0"/>
    <field name="t_id" labelOnTop="0"/>
    <field name="t_ili_tid" labelOnTop="0"/>
    <field name="typ" labelOnTop="0"/>
    <field name="unterhaltsid" labelOnTop="0"/>
    <field name="werkeigentum" labelOnTop="0"/>
    <field name="werksid" labelOnTop="0"/>
  </labelOnTop>
  <widgets>
    <widget name="raemlchlmnt_gsnschft_lment_elemnt_gnssnslmnt_klg_pnkt_fkey">
      <config type="Map">
        <Option name="nm-rel" value="raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_lnie_fkey" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>t_id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
