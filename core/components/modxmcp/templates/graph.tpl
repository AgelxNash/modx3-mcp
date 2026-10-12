
<div id="mcpg" tabindex="0">
    <header class="g-page-header">
        <div class="g-page-heading">
            <h2>Граф связей</h2>
            <p>Изучайте зависимости элементов, находите битые ссылки и неиспользуемый код.</p>
        </div>
        <a class="g-back" href="{$settings_url}">← К настройкам MCP</a>
    </header>
    <div class="g-bar">
        <div class="g-search">
            <input type="search" id="g-q" placeholder="Найти элемент…" autocomplete="off">
            <div class="g-results" id="g-res"></div>
        </div>
        <span class="g-seg">
            <button class="g-btn g-lay on" data-lay="lanes" title="Каждый тип в своём ряду, порядок как в дереве элементов менеджера">Слои</button><button class="g-btn g-lay" data-lay="clusters" title="Типы собраны в отдельные облака">Кластеры</button><button class="g-btn g-lay" data-lay="free" title="Свободная укладка, без разделения по типам">Свободно</button>
        </span>
        <button class="g-btn" id="g-reload">Обновить</button>
        <button class="g-btn" id="g-fit">Вписать</button>
        <button class="g-btn" id="g-reset" disabled>Показать всё</button>
        <span class="g-stat" id="g-stat">Загружаю…</span>
    </div>

    <div class="g-body">
        <aside class="g-side" aria-label="Фильтры и проблемы графа">
            <section>
                <h3>Типы узлов</h3>
                <div id="g-types"></div>
            </section>
            <section>
                <h3>Фильтры</h3>
                <label title="Элементы компонентов, до которых не дотягивается ни один ваш элемент"><input type="checkbox" id="g-hide-vendor"><span class="c">Скрыть вендорные без использования</span><span class="n" id="g-nvendor">0</span></label>
                <label><input type="checkbox" id="g-hide-orphans"><span class="c">Скрыть неиспользуемые</span><span class="n" id="g-norph2">0</span></label>
                <label><input type="checkbox" id="g-only-issues"><span class="c">Только проблемные</span></label>
                <label><input type="checkbox" id="g-res-nodes"><span class="c">Ресурсы по <code>[[~id]]</code></span></label>
            </section>
            <section>
                <h3>Плотность</h3>
                <input type="range" id="g-spread" min="60" max="260" value="100" style="width:100%">
                <div style="display:flex;justify-content:space-between;color:#7b8794;font-size:11px;">
                    <span>плотно</span><span>свободно</span>
                </div>
            </section>
            <section>
                <h3>Битые ссылки (<span id="g-nmiss">0</span>)</h3>
                <ul class="g-list" id="g-miss"></ul>
            </section>
            <section>
                <h3>Не используются (<span id="g-norph">0</span>)</h3>
                <ul class="g-list" id="g-orph"></ul>
                <p class="g-empty-note" id="g-orph-note" style="font-size:11px;margin-top:6px;"></p>
            </section>
        </aside>

        <div class="g-stage">
            <canvas id="g-canvas"></canvas>
            <div class="g-crumb" id="g-crumb"></div>
            <div class="g-overlay" id="g-overlay">Загружаю граф…</div>
            <div class="g-hint">колесо — масштаб · тяните узел или фон · двойной клик по узлу — изолировать · Esc — сбросить</div>
            <div class="g-legend" id="g-legend"></div>
        </div>

        <div class="g-info" id="g-info"></div>
    </div>
</div>
