<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.10.7-A Coruña" hasScaleBasedVisibilityFlag="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions" labelsEnabled="0" minScale="1e+8" simplifyMaxScale="1" maxScale="0" simplifyDrawingTol="1" readOnly="0" simplifyAlgorithm="0" simplifyLocal="1" simplifyDrawingHints="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol clip_to_extent="1" alpha="1" name="0" force_rhr="0" type="marker">
        <layer locked="0" class="SvgMarker" enabled="1" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="211,3,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogPHBhdGggZD0ibTEwLjM5NiAyMS44MzdoODAuMDV2NTUuNTY5aC0xOS4zODZzNS40NjYyLTQxLjk0NC0xOS45MDgtNDIuMTI0Yy0yNS4zNzQtMC4xNzk5LTIwLjM0MyA0MS43NTEtMjAuMzQzIDQxLjc1MWgtMTkuODA3eiIgZmlsbD0icGFyYW0oZmlsbCkiIGZpbGwtb3BhY2l0eT0icGFyYW0oZmlsbC1vcGFjaXR5KSIgc3Ryb2tlPSJwYXJhbShvdXRsaW5lKSIgc3Ryb2tlLW9wYWNpdHk9InBhcmFtKG91dGxpbmUtb3BhY2l0eSkiIHN0cm9rZS13aWR0aD0icGFyYW0ob3V0bGluZS13aWR0aCkiIC8+Cjwvc3ZnPgo="/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,255,255,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="7"/>
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
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
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
    <field name="fahrbahnbreite">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowNull" type="bool"/>
            <Option value="10" name="Max" type="double"/>
            <Option value="0" name="Min" type="double"/>
            <Option value="0" name="Precision" type="int"/>
            <Option value="0.1" name="Step" type="double"/>
            <Option value="SpinBox" name="Style" type="QString"/>
            <Option value="m" name="Suffix" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="laenge">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowNull" type="bool"/>
            <Option value="1e+8" name="Max" type="double"/>
            <Option value="0" name="Min" type="double"/>
            <Option value="0" name="Precision" type="int"/>
            <Option value="1" name="Step" type="double"/>
            <Option value="SpinBox" name="Style" type="QString"/>
            <Option value="m" name="Suffix" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bautyp">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="ilicode" name="Key" type="QString"/>
            <Option value="bautyp_d497279f_38cd_424f_97e1_be7a70b2b74e" name="Layer" type="QString"/>
            <Option value="Bautyp" name="LayerName" type="QString"/>
            <Option value="postgres" name="LayerProviderName" type="QString"/>
            <Option value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;bautyp&quot; sql=" name="LayerSource" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="true" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="dispname" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tonnage">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowNull" type="bool"/>
            <Option value="100" name="Max" type="double"/>
            <Option value="0" name="Min" type="double"/>
            <Option value="0" name="Precision" type="int"/>
            <Option value="1" name="Step" type="double"/>
            <Option value="SpinBox" name="Style" type="QString"/>
            <Option value="t" name="Suffix" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="material">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="ilicode" name="Key" type="QString"/>
            <Option value="raeumlichelmnte_wege_bruecke_lehnenviadukt_material_b3840b72_a548_456f_a0f9_71f0d248e07f" name="Layer" type="QString"/>
            <Option value="Material (Wege Brücke Lehnenviadukt)" name="LayerName" type="QString"/>
            <Option value="postgres" name="LayerProviderName" type="QString"/>
            <Option value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;raeumlichelmnte_wege_bruecke_lehnenviadukt_material&quot; sql=" name="LayerSource" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="true" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="dispname" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="widerlager">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="" name="UncheckedState" type="QString"/>
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
            <Option value="raemlchlmnt_wrck_lhnnvdukt_projekt_fkey" name="Relation" type="QString"/>
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
            <Option value="raemlchlmnt_wrck_lhnnvdukt_werkeigentum_fkey" name="Relation" type="QString"/>
            <Option value="false" name="ShowForm" type="bool"/>
            <Option value="true" name="ShowOpenFormButton" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="t_id" index="0" name=""/>
    <alias field="t_ili_tid" index="1" name=""/>
    <alias field="fahrbahnbreite" index="2" name="Fahrbahnbreite [m]"/>
    <alias field="laenge" index="3" name="Länge [m]"/>
    <alias field="bautyp" index="4" name="Bautyp"/>
    <alias field="tonnage" index="5" name="Tonnage [t]"/>
    <alias field="material" index="6" name="Material"/>
    <alias field="widerlager" index="7" name="Widerlager"/>
    <alias field="astatus" index="8" name="Status"/>
    <alias field="status_datum" index="9" name="Datum Status"/>
    <alias field="bauabnahme_datum" index="10" name="Datum Bauabnahme"/>
    <alias field="werksid" index="11" name="WerksID"/>
    <alias field="unterhaltsid" index="12" name="UnterhaltsID"/>
    <alias field="projekt" index="13" name="Projekt"/>
    <alias field="werkeigentum" index="14" name="Werkeigentum"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="t_id" applyOnUpdate="0"/>
    <default expression="" field="t_ili_tid" applyOnUpdate="0"/>
    <default expression="4" field="fahrbahnbreite" applyOnUpdate="0"/>
    <default expression="10" field="laenge" applyOnUpdate="0"/>
    <default expression="'Ausbau_Ersatz'" field="bautyp" applyOnUpdate="0"/>
    <default expression="" field="tonnage" applyOnUpdate="0"/>
    <default expression="'Beton'" field="material" applyOnUpdate="0"/>
    <default expression="true" field="widerlager" applyOnUpdate="0"/>
    <default expression="'projektiert'" field="astatus" applyOnUpdate="0"/>
    <default expression="format_date(now(),'yyyy-MM-dd')" field="status_datum" applyOnUpdate="0"/>
    <default expression="" field="bauabnahme_datum" applyOnUpdate="0"/>
    <default expression="" field="werksid" applyOnUpdate="0"/>
    <default expression="" field="unterhaltsid" applyOnUpdate="0"/>
    <default expression="" field="projekt" applyOnUpdate="0"/>
    <default expression="" field="werkeigentum" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="3" unique_strength="1" notnull_strength="1" field="t_id" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="t_ili_tid" exp_strength="0"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="fahrbahnbreite" exp_strength="1"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="laenge" exp_strength="2"/>
    <constraint constraints="1" unique_strength="0" notnull_strength="1" field="bautyp" exp_strength="0"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="tonnage" exp_strength="1"/>
    <constraint constraints="1" unique_strength="0" notnull_strength="1" field="material" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="widerlager" exp_strength="0"/>
    <constraint constraints="1" unique_strength="0" notnull_strength="1" field="astatus" exp_strength="0"/>
    <constraint constraints="5" unique_strength="0" notnull_strength="1" field="status_datum" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="bauabnahme_datum" exp_strength="1"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="werksid" exp_strength="1"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="unterhaltsid" exp_strength="1"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="projekt" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="werkeigentum" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="t_id" exp="" desc=""/>
    <constraint field="t_ili_tid" exp="" desc=""/>
    <constraint field="fahrbahnbreite" exp="fahrbahnbreite IS NULL or (fahrbahnbreite >= 0 and fahrbahnbreite &lt;= 10)" desc="Fahrbahnbreite muss zwischen 0 und 10 liegen."/>
    <constraint field="laenge" exp="laenge IS NULL OR (laenge >= 0 and laenge &lt;= 100000000)" desc="Länge muss zwischen 0 und 100000000 liegen."/>
    <constraint field="bautyp" exp="" desc=""/>
    <constraint field="tonnage" exp=" tonnage IS NULL OR (tonnage >= 0 AND tonnage &lt;= 100)" desc="Die Tonnage muss zwischen 0 und 100 sein."/>
    <constraint field="material" exp="" desc=""/>
    <constraint field="widerlager" exp="" desc=""/>
    <constraint field="astatus" exp="" desc=""/>
    <constraint field="status_datum" exp="status_datum >= to_date('1800-01-01') and status_datum &lt;= to_date('2099-12-31')" desc="Datum Status muss zwischen 1.1.1800 und 31.12.2099 liegen."/>
    <constraint field="bauabnahme_datum" exp="bauabnahme_datum IS NULL or (bauabnahme_datum >= to_date('1800-01-01') and bauabnahme_datum &lt;= to_date('2099-12-31'))" desc="Datum Bauabnahme muss zwischen 1.1.1800 und 31.12.2099 liegen."/>
    <constraint field="werksid" exp="werksid IS NULL OR length(werksid) &lt;= 20" desc="WerksID darf maximal 20 Zeichen lang sein.&#xa;"/>
    <constraint field="unterhaltsid" exp="unterhaltsid IS NULL OR length(unterhaltsid) &lt;= 20" desc="Die UnterhaltsID darf maximal 20 Zeichen lang sein."/>
    <constraint field="projekt" exp="" desc=""/>
    <constraint field="werkeigentum" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" name="t_id" type="field" hidden="0"/>
      <column width="-1" name="t_ili_tid" type="field" hidden="0"/>
      <column width="-1" name="fahrbahnbreite" type="field" hidden="0"/>
      <column width="-1" name="laenge" type="field" hidden="0"/>
      <column width="-1" name="bautyp" type="field" hidden="0"/>
      <column width="-1" name="tonnage" type="field" hidden="0"/>
      <column width="-1" name="material" type="field" hidden="0"/>
      <column width="-1" name="widerlager" type="field" hidden="0"/>
      <column width="-1" name="astatus" type="field" hidden="0"/>
      <column width="-1" name="status_datum" type="field" hidden="0"/>
      <column width="-1" name="bauabnahme_datum" type="field" hidden="0"/>
      <column width="-1" name="werksid" type="field" hidden="0"/>
      <column width="-1" name="unterhaltsid" type="field" hidden="0"/>
      <column width="-1" name="projekt" type="field" hidden="0"/>
      <column width="-1" name="werkeigentum" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
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
    <attributeEditorContainer columnCount="2" groupBox="0" name="Brücke &amp; Viadukt" visibilityExpressionEnabled="0" showLabel="1" visibilityExpression="">
      <attributeEditorField name="material" index="6" showLabel="1"/>
      <attributeEditorField name="tonnage" index="5" showLabel="1"/>
      <attributeEditorField name="bautyp" index="4" showLabel="1"/>
      <attributeEditorField name="widerlager" index="7" showLabel="1"/>
      <attributeEditorField name="bauabnahme_datum" index="10" showLabel="1"/>
      <attributeEditorField name="astatus" index="8" showLabel="1"/>
      <attributeEditorField name="status_datum" index="9" showLabel="1"/>
      <attributeEditorField name="laenge" index="3" showLabel="1"/>
      <attributeEditorField name="fahrbahnbreite" index="2" showLabel="1"/>
      <attributeEditorField name="projekt" index="13" showLabel="1"/>
      <attributeEditorField name="werksid" index="11" showLabel="1"/>
      <attributeEditorField name="werkeigentum" index="14" showLabel="1"/>
      <attributeEditorField name="unterhaltsid" index="12" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" groupBox="0" name="Genossenschaft" visibilityExpressionEnabled="0" showLabel="1" visibilityExpression="">
      <attributeEditorRelation name="raemlchlmnt_gsnschft_lment_elemnt_gnssnsrck_lhnnvdukt_fkey" showUnlinkButton="1" showLabel="0" showLinkButton="1" relation="raemlchlmnt_gsnschft_lment_elemnt_gnssnsrck_lhnnvdukt_fkey"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" groupBox="0" name="Debugging" visibilityExpressionEnabled="1" showLabel="1" visibilityExpression="eval(@debugging)">
      <attributeEditorField name="t_ili_tid" index="1" showLabel="1"/>
      <attributeEditorField name="t_id" index="0" showLabel="1"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="astatus" editable="1"/>
    <field name="bauabnahme_datum" editable="1"/>
    <field name="bautyp" editable="1"/>
    <field name="fahrbahnbreite" editable="1"/>
    <field name="laenge" editable="1"/>
    <field name="material" editable="1"/>
    <field name="projekt" editable="1"/>
    <field name="status_datum" editable="1"/>
    <field name="t_id" editable="1"/>
    <field name="t_ili_tid" editable="1"/>
    <field name="tonnage" editable="1"/>
    <field name="unterhaltsid" editable="1"/>
    <field name="werkeigentum" editable="1"/>
    <field name="werksid" editable="1"/>
    <field name="widerlager" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="astatus"/>
    <field labelOnTop="0" name="bauabnahme_datum"/>
    <field labelOnTop="0" name="bautyp"/>
    <field labelOnTop="0" name="fahrbahnbreite"/>
    <field labelOnTop="0" name="laenge"/>
    <field labelOnTop="0" name="material"/>
    <field labelOnTop="0" name="projekt"/>
    <field labelOnTop="0" name="status_datum"/>
    <field labelOnTop="0" name="t_id"/>
    <field labelOnTop="0" name="t_ili_tid"/>
    <field labelOnTop="0" name="tonnage"/>
    <field labelOnTop="0" name="unterhaltsid"/>
    <field labelOnTop="0" name="werkeigentum"/>
    <field labelOnTop="0" name="werksid"/>
    <field labelOnTop="0" name="widerlager"/>
  </labelOnTop>
  <widgets>
    <widget name="raemlchlmnt_gsnschft_lment_elemnt_gnssnsrck_lhnnvdukt_fkey">
      <config type="Map">
        <Option value="raemlchlmnt_gsnschft_lment_genossenschaft_element_fkey" name="nm-rel" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>'Brücke / Lehnenviadukt' || COALESCE(' (' || t_id || ')','')</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
