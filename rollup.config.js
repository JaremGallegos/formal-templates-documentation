const builtins = require('@erquhart/rollup-plugin-node-builtins');
const commonjs = require('rollup-plugin-commonjs');
const node_resolve = require('rollup-plugin-node-resolve');
const json = require('rollup-plugin-json');

export default {
    plugins: [
        builtins(),
        node_resolve(),
        commonjs(),
        json()
    ]
}