<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyMaxScale="1" simplifyDrawingHints="0" simplifyAlgorithm="0" version="3.10.6-A Coruña" maxScale="0" minScale="1e+8" simplifyDrawingTol="1" labelsEnabled="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" type="categorizedSymbol" symbollevels="0" attr="typ" enableorderby="0">
    <categories>
      <category value="Holzkasten" symbol="0" label="Holzkasten" render="true"/>
      <category value="Weitere_Boeschungssicherungsmassnahmen" symbol="1" label="Weitere Böschungssicherungsmassnahmen" render="true"/>
    </categories>
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" name="0" type="marker" alpha="1">
        <layer class="SimpleMarker" pass="0" locked="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,128,128,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="square"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" name="1" type="marker" alpha="1">
        <layer class="SimpleMarker" pass="0" locked="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,128,128,255"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol clip_to_extent="1" force_rhr="0" name="0" type="marker" alpha="1">
        <layer class="SimpleMarker" pass="0" locked="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="229,182,54,255"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="t_id"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions geometryPrecision="0.001" removeDuplicateNodes="1">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="t_id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
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
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="ilicode" name="Key" type="QString"/>
            <Option value="wiederherstellung_punkte_c0495fe6_4ff3_4b08_ad05_e0afdbf05ca3" name="Layer" type="QString"/>
            <Option value="Wiederherstellung Punkte" name="LayerName" type="QString"/>
            <Option value="postgres" name="LayerProviderName" type="QString"/>
            <Option value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;wiederherstellung_punkte&quot; sql=" name="LayerSource" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="true" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="dispname" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="astatus">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="ilicode" name="Key" type="QString"/>
            <Option value="astatus_8c9aab94_4b62_4ec0_ae4a_4387a26bd61a" name="Layer" type="QString"/>
            <Option value="Status" name="LayerName" type="QString"/>
            <Option value="postgres" name="LayerProviderName" type="QString"/>
            <Option value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;astatus&quot; sql=" name="LayerSource" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="true" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="dispname" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_datum">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" name="allow_null" type="bool"/>
            <Option value="true" name="calendar_popup" type="bool"/>
            <Option value="dd.MM.yyyy" name="display_format" type="QString"/>
            <Option value="yyyy-MM-dd" name="field_format" type="QString"/>
            <Option value="false" name="field_iso_format" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bauabnahme_datum">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" name="allow_null" type="bool"/>
            <Option value="true" name="calendar_popup" type="bool"/>
            <Option value="dd.MM.yyyy" name="display_format" type="QString"/>
            <Option value="yyyy-MM-dd" name="field_format" type="QString"/>
            <Option value="false" name="field_iso_format" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="werksid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="unterhaltsid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="projekt">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowAddFeatures" type="bool"/>
            <Option value="false" name="AllowNULL" type="bool"/>
            <Option value="true" name="MapIdentification" type="bool"/>
            <Option value="true" name="OrderByValue" type="bool"/>
            <Option value="false" name="ReadOnly" type="bool"/>
            <Option value="raemlchlmnt_whrstllng_pnkt_projekt_fkey" name="Relation" type="QString"/>
            <Option value="false" name="ShowForm" type="bool"/>
            <Option value="true" name="ShowOpenFormButton" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="werkeigentum">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowAddFeatures" type="bool"/>
            <Option value="true" name="AllowNULL" type="bool"/>
            <Option value="false" name="MapIdentification" type="bool"/>
            <Option value="true" name="OrderByValue" type="bool"/>
            <Option value="false" name="ReadOnly" type="bool"/>
            <Option value="raemlchlmnt_whrstllng_pnkt_werkeigentum_fkey" name="Relation" type="QString"/>
            <Option value="false" name="ShowForm" type="bool"/>
            <Option value="true" name="ShowOpenFormButton" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="t_id" name="" index="0"/>
    <alias field="t_ili_tid" name="" index="1"/>
    <alias field="typ" name="Typ" index="2"/>
    <alias field="astatus" name="Status" index="3"/>
    <alias field="status_datum" name="Datum Status" index="4"/>
    <alias field="bauabnahme_datum" name="Datum Bauabnahme" index="5"/>
    <alias field="werksid" name="WerksID" index="6"/>
    <alias field="unterhaltsid" name="UnterhaltsID" index="7"/>
    <alias field="projekt" name="Projekt" index="8"/>
    <alias field="werkeigentum" name="Werkeigentum" index="9"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="t_id" applyOnUpdate="0" expression=""/>
    <default field="t_ili_tid" applyOnUpdate="0" expression=""/>
    <default field="typ" applyOnUpdate="0" expression="'Holzkasten'"/>
    <default field="astatus" applyOnUpdate="0" expression="'projektiert'"/>
    <default field="status_datum" applyOnUpdate="0" expression="format_date(now(), 'yyyy-MM-dd')"/>
    <default field="bauabnahme_datum" applyOnUpdate="0" expression=""/>
    <default field="werksid" applyOnUpdate="0" expression=""/>
    <default field="unterhaltsid" applyOnUpdate="0" expression=""/>
    <default field="projekt" applyOnUpdate="0" expression=""/>
    <default field="werkeigentum" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint field="t_id" exp_strength="0" constraints="3" notnull_strength="1" unique_strength="1"/>
    <constraint field="t_ili_tid" exp_strength="0" constraints="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="typ" exp_strength="0" constraints="1" notnull_strength="1" unique_strength="0"/>
    <constraint field="astatus" exp_strength="0" constraints="1" notnull_strength="1" unique_strength="0"/>
    <constraint field="status_datum" exp_strength="1" constraints="5" notnull_strength="1" unique_strength="0"/>
    <constraint field="bauabnahme_datum" exp_strength="1" constraints="4" notnull_strength="0" unique_strength="0"/>
    <constraint field="werksid" exp_strength="1" constraints="4" notnull_strength="0" unique_strength="0"/>
    <constraint field="unterhaltsid" exp_strength="1" constraints="4" notnull_strength="0" unique_strength="0"/>
    <constraint field="projekt" exp_strength="0" constraints="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="werkeigentum" exp_strength="0" constraints="0" notnull_strength="0" unique_strength="0"/>
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
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" name="t_id" type="field" width="-1"/>
      <column hidden="0" name="t_ili_tid" type="field" width="-1"/>
      <column hidden="0" name="typ" type="field" width="-1"/>
      <column hidden="0" name="astatus" type="field" width="-1"/>
      <column hidden="0" name="status_datum" type="field" width="-1"/>
      <column hidden="0" name="bauabnahme_datum" type="field" width="-1"/>
      <column hidden="0" name="werksid" type="field" width="-1"/>
      <column hidden="0" name="unterhaltsid" type="field" width="-1"/>
      <column hidden="0" name="projekt" type="field" width="-1"/>
      <column hidden="0" name="werkeigentum" type="field" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
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
    <attributeEditorContainer showLabel="1" visibilityExpression="" name="Wiederherstellung Punkt" columnCount="2" groupBox="0" visibilityExpressionEnabled="0">
      <attributeEditorField showLabel="1" name="typ" index="2"/>
      <attributeEditorField showLabel="1" name="bauabnahme_datum" index="5"/>
      <attributeEditorField showLabel="1" name="astatus" index="3"/>
      <attributeEditorField showLabel="1" name="status_datum" index="4"/>
      <attributeEditorField showLabel="1" name="projekt" index="8"/>
      <attributeEditorField showLabel="1" name="werkeigentum" index="9"/>
      <attributeEditorField showLabel="1" name="werksid" index="6"/>
      <attributeEditorField showLabel="1" name="unterhaltsid" index="7"/>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="" name="Genossenschaft" columnCount="1" groupBox="0" visibilityExpressionEnabled="0">
      <attributeEditorRelation showLabel="0" showLinkButton="1" showUnlinkButton="1" relation="raemlchlmnt_gsnschft_lment_elemnt_gnssnshrstllng_pnkt_fkey" name="raemlchlmnt_gsnschft_lment_elemnt_gnssnshrstllng_pnkt_fkey"/>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="" name="Dokumente" columnCount="1" groupBox="0" visibilityExpressionEnabled="0">
      <attributeEditorRelation showLabel="0" showLinkButton="1" showUnlinkButton="1" relation="raeumlicheelemnte_dokument_wiederherstellungs_punkt_fkey" name="raeumlicheelemnte_dokument_wiederherstellungs_punkt_fkey"/>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="eval(@debugging)" name="Debugging" columnCount="2" groupBox="0" visibilityExpressionEnabled="1">
      <attributeEditorField showLabel="1" name="t_ili_tid" index="1"/>
      <attributeEditorField showLabel="1" name="t_id" index="0"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="astatus"/>
    <field editable="1" name="bauabnahme_datum"/>
    <field editable="1" name="projekt"/>
    <field editable="1" name="status_datum"/>
    <field editable="1" name="t_id"/>
    <field editable="1" name="t_ili_tid"/>
    <field editable="1" name="typ"/>
    <field editable="1" name="unterhaltsid"/>
    <field editable="1" name="werkeigentum"/>
    <field editable="1" name="werksid"/>
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
    <widget name="raemlchlmnt_gsnschft_lment_elemnt_gnssnshrstllng_pnkt_fkey">
      <config type="Map">
        <Option value="raemlchlmnt_gsnschft_lment_genossenschaft_element_fkey" name="nm-rel" type="QString"/>
      </config>
    </widget>
    <widget name="raeumlicheelemnte_dokument_wiederherstellungs_punkt_fkey">
      <config type="Map">
        <Option value="" name="nm-rel" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>represent_value(typ) || COALESCE(' (' || t_id || ')','')</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
