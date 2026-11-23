Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438322;
	b=OSLa/aeGThBV5ierxhc5ROL9ZDHmk+XobGK93GI9TkcAwQI9MF6jJxa4iGvusMDdFbzp
	 OgEHm5kgEz7+HAW4gDwhfaPOefkahNllCvbFip5BGAmBJ+TrgH/tOVxm/Nk3YvHq3mZEq
	 TgDX3162LjVqqwyEoK6rPO2x5RemTlJzlnYcj5tRj1GbV8I1qid0G/xdqEZHbPsLHc+Bc
	 pcjUlGudGW4AgYK5+pVHSCLhoyIiQaLSZEbNGwCX0D33vK1psVbhTNrJDY77S9cfuvWrd
	 0K8/p4jjTySV7tdcFjVTa8ULOYpIZyDqfc1uDXRBr4cepX6HBts+rlPsMmPSIlmfUmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438322;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p2IWpjpm56FZDYL2J6E/8Z+eeikvXsCr0/LAHQK5bkI=;
	b=h0fpuylPh3Mh0xJw/wSyA3BN7dPYaI5lVhx6rGw+lSTqi57i9TNcBZFKZBB0dvhI9ja5
	 XU8ii1Usq7S2dBRrms0klfM+GECL9oRotD6CLIk1AduvKGSvzfbzqh3ANlWYIDMsZufdF
	 AyGA/7mvh0NXTul8tY+B+ApoNzBap7nGXHNC9qwXy6Osm8rkygsarD80HHFN5gPz/PkEV
	 XDjlmgsJwgBcPkvUh3nvzRK45w6PqBW3jzOsYqSPjYfJ8dfquVI+HPrIMhZfmODpNWdYs
	 FP9svOwrWvUA7drknMjsdLKVdQv5+XLxfTkMz4XnzRFDxSn+RVc2DMkYPB09KFIfL5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEyiJbLf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99183606A334;
	Mon, 23 Nov 2026 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEyiJbLf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B24F1F000C4;
	Mon, 23 Nov 2026 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438322;
	bh=p2IWpjpm56FZDYL2J6E/8Z+eeikvXsCr0/LAHQK5bkI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KEyiJbLfUDmsEJfa1Kx/wZf9FzRuBcw9SnMx6X/r0k/X0spu68I7dygL0JCwYiJKh
	 eNcqEI+kKP7ihvrND/GSFYfWRGr9VwVGWa/qGPz6rGUR8FruTfUHko0l4Bww8stA/a
	 /JPdAHt9y0Lkc08FputF9Y4puMnCcfik0wTll5OxW79iwDDGt47r7dvaTb+9Hn6Taf
	 6I7RxaCWCy5EZNfPED2PCI/rNlG84I+cvDWvC1pHS7m0AStNksuJQ8pBMgE7fJU2N8
	 DWTbLLeZnpAMV0XidiIo3lpjCEbnsC5yS5RUom6JWBScIt7dG1T/B+sg8yYX46aVOr
	 ev1jZdef4GztQ==
Subject: Re: [PATCH v35 net-next 2/8] net/nebula-matrix: add common resource
 implementation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:52:01 +0000
Message-ID: <179543832118.3135.18073760250615993889@kernel.org>
In-Reply-To: <20261119113530.32107-3-illusion.wang@nebula-matrix.com>
References: <20261119113530.32107-3-illusion.wang@nebula-matrix.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The control-PF probe reads firmware-written board
  configuration from the mailbox BAR exactly once: the DW3 port…
- [Low] net/nebula-matrix: single-implementation hw_ops and commit
  message mismatch

--

net/nebula-matrix: add common resource implementation

This adds a chip-agnostic resource layer for the Nebula Matrix driver. On
the control PF it reads the PF topology, per-PF BDF, Ethernet port and VSI
mappings from hardware and firmware registers once at probe time. It also
adds plain lookup helpers that convert between VSI, PF and Ethernet IDs.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> index f363ab1fd4168..fa5b88e8c70fc 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c

[ ... ]

> +/*
> + * Registers reset to zero after cold boot / FLR / bus reset. Firmware
> + * programs valid values before driver probe, so zero is only seen on
> + * hardware fault or register read failure. Initialize data=0 to guard
> + * against nbl_hw_read_mbx_regs() early-return on bounds-check failure.
> + */
> +static void nbl_hw_get_fw_eth_map(struct nbl_hw_mgt *hw_mgt, u32 *eth_map)
> +{
> +	u32 data = 0;
> +
> +	nbl_hw_read_mbx_regs(hw_mgt, NBL_FW_BOARD_DW6_OFFSET, &data,
> +			     sizeof(data));
> +	*eth_map = FIELD_GET(NBL_FW_BOARD_DW6_ETH_BITMAP_MASK, data);
> +}

[ ... ]

> +static void nbl_hw_get_board_info(struct nbl_hw_mgt *hw_mgt,
> +				  struct nbl_board_port_info *board_info)
> +{
> +	u32 data = 0;
> +
> +	nbl_hw_read_mbx_regs(hw_mgt, NBL_FW_BOARD_DW3_OFFSET, &data,
> +			     sizeof(data));
> +	board_info->eth_num = FIELD_GET(NBL_FW_BOARD_DW3_PORT_NUM_MASK, data);

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c
> new file mode 100644
> index 0000000000000..b96ac999ec82f
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c

[ ... ]

> +static int nbl_res_ctrl_dev_setup_eth_info(struct nbl_resource_mgt *res_mgt)
> +{

[ ... ]

> +	fw_port_num = res_mgt->resource_info->board_info.eth_num;
> +
> +	hw_ops->get_fw_eth_map(res_mgt->hw_ops_tbl->priv, &eth_bitmap);
> +	if (eth_bitmap & ~((1 << NBL_MAX_ETHERNET) - 1)) {
> +		dev_err(dev, "FW reported invalid eth_bitmap 0x%x\n",
> +			eth_bitmap);
> +		return -EINVAL;
> +	}
> +	if (fw_port_num != hweight32(eth_bitmap)) {
> +		dev_err(dev, "FW inconsistency: port_num=%u, bitmap=0x%x\n",
> +			fw_port_num, eth_bitmap);
> +		return -EINVAL;
> +	}
> +	/*
> +	 * Firmware is ready before probe. Valid port counts are 1/2/4;
> +	 * 0 (invalid config), 3 (unsupported topology), and >4 (exceeds
> +	 * hardware max) are all rejected with -EINVAL.
> +	 */
> +	if (fw_port_num == 0 || fw_port_num == 3 ||
> +	    fw_port_num > NBL_MAX_ETHERNET) {
> +		dev_err(dev, "FW reports %u Ethernet ports, unsupported (valid: 1/2/4)\n",
> +			fw_port_num);
> +		return -EINVAL;
> +	}

[Severity: Medium]
What happens if the control PF is probed before firmware has rewritten the
DW3 and DW6 board words?

The comment above nbl_hw_get_fw_eth_map() and nbl_hw_get_board_info() says
these registers reset to zero after cold boot, FLR or bus reset. It relies on
firmware programming them before probe.

The probe path doesn't seem to check that this has happened. There is no
ready bit, poll or -EPROBE_DEFER between nbl_hw_init_leonis() and these
single reads:

nbl_probe()->nbl_core_init()->nbl_res_init_leonis()->nbl_res_start()
    ->nbl_res_init_board_info()
    ->nbl_res_ctrl_dev_setup_eth_info()

If PF0 is bound shortly after an FLR or secondary bus reset, for example a
sysfs reset followed by a bind, both reads could return 0. Then:

    eth_bitmap == 0       passes the check for bits above NBL_MAX_ETHERNET
    fw_port_num == 0      passes fw_port_num != hweight32(eth_bitmap)
    fw_port_num == 0      returns -EINVAL

The control PF probe would then fail for good. Later in the series the
sibling PFs wait on function 0 via nbl_probe_chip_deps(). Would they stay in
-EPROBE_DEFER until the management PF is rebound by hand?

Could the all-zero case be treated as "firmware not ready yet" instead of an
invalid configuration? A bounded readiness poll in nbl_res_start(), or
returning -EPROBE_DEFER for that case, would do it.

> +	eth_info->eth_num = fw_port_num;

[ ... ]

> +static int nbl_res_start(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_common_info *common = res_mgt->common;
> +	int ret = 0;
> +
> +	if (common->has_ctrl) {
> +		nbl_res_init_board_info(res_mgt);
> +
> +		ret = nbl_res_init_pf_num(res_mgt);
> +		if (ret)
> +			return ret;

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_hw.h b/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_hw.h
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_hw.h
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_hw.h
> @@ -44,9 +57,22 @@ struct nbl_hw_ops {
>  	 * PFs starting at PF0.
>  	 */
>  	void (*get_host_pf_mask)(struct nbl_hw_mgt *hw_mgt, u32 *pf_mask);
> +	void (*get_real_bus)(struct nbl_hw_mgt *hw_mgt, u8 *bus);
>  
>  	void (*cfg_mailbox_qinfo)(struct nbl_hw_mgt *hw_mgt, u16 func_id,
>  				  u8 bus, u8 devid, u8 function);
> +	void (*get_fw_eth_map)(struct nbl_hw_mgt *hw_mgt, u32 *eth_map);
> +	/**
> +	 * get_board_info - Fetch board info from firmware
> +	 * @hw_mgt: hardware management context
> +	 * @board_info: output pointer for board info structure
> +	 *
> +	 * Firmware contract: board_info.eth_num MUST equal the number of
> +	 * unmasked PFs from get_host_pf_mask(). See get_host_pf_mask for
> +	 * details.
> +	 */
> +	void (*get_board_info)(struct nbl_hw_mgt *hw_mgt,
> +			       struct nbl_board_port_info *board_info);
>  };
>  
>  struct nbl_hw_ops_tbl {

[Severity: Low]
This patch adds four more callbacks to struct nbl_hw_ops (flush_write,
get_real_bus, get_fw_eth_map and get_board_info), and nbl_hw_ops still
has only one implementation, the static hw_ops in nbl_hw_leonis.c.
v35 dropped nbl_resource_ops after the earlier request not to add ops
tables until a second implementation exists. Does the same reasoning
apply to nbl_hw_ops?

The callers in nbl_res_init_pf_num(), nbl_res_ctrl_dev_pf_info_init(),
nbl_res_ctrl_dev_setup_eth_info() and nbl_res_init_board_info() are all
in nbl_hw_leonis/nbl_resource_leonis.c, so this is Leonis code calling
Leonis helpers through res_mgt->hw_ops_tbl->ops. nbl_hw_setup_ops()
also devm-allocates a wrapper whose only job is to point at a static
table. Could these be direct calls until draco actually lands?

The commit message also doesn't seem to match the code. It says
nbl_hw_ops_tbl is the only remaining ops table, but struct
nbl_channel_ops_tbl is already in struct nbl_interface, and a later
patch in the series adds struct nbl_dispatch_ops_tbl. It also says the
PF mask validation and the BDF/Eth/VSI table construction are shared
between the two chip families. Those are static functions in
nbl_resource_leonis.c, called only from nbl_res_init_leonis(). Only the
ID conversion helpers in nbl_resource.c are chip-agnostic. Can the
description be updated, or the shared code moved where the message
says it is?

Finally, this patch removes the NULL checks on the static hw_ops
members in nbl_hw_setup_ops() that the channel layer patch earlier in
this series added. Those checks could never fire. Could they be left
out of the patch that introduces nbl_hw_setup_ops(), so this one does
not have to delete them?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119113530.32107-1-illusion.wang%40nebula-matrix.com
