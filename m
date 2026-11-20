Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167450;
	b=dHY7RF4Z/we8zrXrhTBvSU6qlvgGJ0fNXonYSaIFCQsOf83/T93RJwoCGGiGD58QKQl4
	 KJjkv6VRzADsDJg5UdinXlH1Pgh6Scp6Jb1ZwvGVSaof29ARbSQ960EBIWTgrrCjdQSwM
	 Bj+5DNhskJSiqZt78sMuD+V7Vz7TW7e9tCWi55lWb0dfRn6S+Xpn3+Y2p5XLxVXfSbN9I
	 Z3oT0NZef1lbx6YFbJZwTe9IWQ+PFkRLpsH86gtR7Xtq59KvGkTt3y0f48fgdQ74H2YXx
	 88NUzdwaK7/Kk4u8DtZrWpU5PnBPU8weuRfskwKspsYwwkY3xOLGVo6n2buLlXASvKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167450;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nZz2QAmDzQFvqzE+UWtcCdHPziu34TyJ5fAGcQb5M38=;
	b=iySNqEN6Wz7MllUzK9lF3EZhitLrpHhRfTwMmwqdWaWgf0fOS5t4wcNLywR4syAG+/or
	 1WlJlYUT9irfSg3yf8ngQ9N6WZU3tH+ixXDHn6lq3ddH2JZ4k5Pn8z1QFF7aAMF0NASGS
	 RnYmX6r/Elm/vBl4Q87ESs8WQ8g0TFd8T1MAV5jfth8cFh+qLGJi7HQx8HTLpuRGMa4cy
	 VCOiNafwtD/Zp8jXMnw7tFrL4jbG6ETev9CnGuW2s7cDXK/pcnAUjopN2m0LuvFcycdFg
	 JfxXzhAzmdQ0ltL76AyQ7t7R+2zyE3zCUWN45MGPKRVLxnY8O5T3eo61Gdg0XGyGC2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f2akA6Ir;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400E606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7400E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f2akA6Ir
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8DN59iopTFjK8aYzOxjqCZchYMU6lENZWu1VWKz4geI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795167447; v=1; x=1795772247;
 b=f2akA6IruOg8TeNrR1+vJ+41i7FYCfS//1uzUKaBRz7uEsZrNMfkXreL2VDpY7yXdKTvL6m1
 UB7Ox+J2g2Pl+9XTdlDHYz6kaTHdXVYLT1DutTZQbOKQlPYv81g955I7r1phKmOyVLcTXqWHXmD
 yiqovanyWo+8tyL/Kc6xL5PY=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3008a7ca7c677b1c;
	Fri, 20 Nov 2026 09:37:27 +0000
X-Mizu-Trace-ID: 3008a7ca7c677b1c
X-Migadu-Flow: FLOW_OUT
Message-ID: <96f5430f-b197-4a51-909a-79cbe86393e3@linux.dev>
Date: Fri, 20 Nov 2026 10:37:24 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 19/24] net: dsa: rzn1-a5psw: Get VLAN_RES
 field layout from OF data
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-20-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-20-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The VLAN_RES field layout differs between RZ/N1 and RZ/T2H/RZ/N2H.
> RZ/N1 uses PORTMASK[4:0] and VLANID[16:5], whereas RZ/T2H and
> RZ/N2H use PORTMASK[3:0] and VLANID[15:4] to accommodate their
> four-port configuration.
> 
> Move the VLANID and PORTMASK field masks into struct a5psw_of_data
> and use field_get() and field_prep() to access the respective fields.
> 
> Populate the OF data with the existing RZ/N1 field layout, allowing
> SoC-specific layouts to be provided when adding support for RZ/T2H
> and RZ/N2H.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - New patch
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 9 ++++++---
>   drivers/net/dsa/rzn1_a5psw.h | 6 ++++--
>   2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 6f3f902f9f4c..7e9bc252d92a 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -691,7 +691,7 @@ static int a5psw_find_vlan_entry(struct a5psw *a5psw, u16 vid)
>   	/* Find vlan for this port */
>   	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
>   		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
> -		if (FIELD_GET(A5PSW_VLAN_RES_VLANID, vlan_res) == vid)
> +		if (field_get(a5psw->of_data->vlan_res_vlanid, vlan_res) == vid)
>   			return i;
>   	}
>   
> @@ -706,8 +706,9 @@ static int a5psw_new_vlan_res_entry(struct a5psw *a5psw, u16 newvid)
>   	/* Find a free VLAN entry */
>   	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
>   		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
> -		if (!(FIELD_GET(A5PSW_VLAN_RES_PORTMASK, vlan_res))) {
> -			vlan_res = FIELD_PREP(A5PSW_VLAN_RES_VLANID, newvid);
> +		if (!field_get(a5psw->of_data->vlan_res_portmask, vlan_res)) {
> +			vlan_res = field_prep(a5psw->of_data->vlan_res_vlanid,
> +					      newvid);
>   			a5psw_reg_writel(a5psw, A5PSW_VLAN_RES(i), vlan_res);
>   			return i;
>   		}
> @@ -1354,6 +1355,8 @@ static const struct a5psw_of_data rzn1_of_data = {
>   	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
>   	.rxmatch_config_base = 0x3e80,
>   	.pattern_ctrl_base = 0x3eb0,
> +	.vlan_res_vlanid = GENMASK(16, 5),
> +	.vlan_res_portmask = GENMASK(4, 0),
>   };
>   
>   static const struct of_device_id a5psw_of_mtable[] = {
> diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
> index 5c5f5ec25774..29d205e2331d 100644
> --- a/drivers/net/dsa/rzn1_a5psw.h
> +++ b/drivers/net/dsa/rzn1_a5psw.h
> @@ -71,8 +71,6 @@
>   #define A5PSW_VLAN_RES_WR_PORTMASK	BIT(30)
>   #define A5PSW_VLAN_RES_WR_TAGMASK	BIT(29)
>   #define A5PSW_VLAN_RES_RD_TAGMASK	BIT(28)
> -#define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
> -#define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
>   
>   #define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
>   #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
> @@ -241,6 +239,8 @@ union lk_data {
>    *   port to account for the HW issue.
>    * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
>    * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
> + * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
> + * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
>    */
>   struct a5psw_of_data {
>   	unsigned int nports;
> @@ -250,6 +250,8 @@ struct a5psw_of_data {
>   	unsigned int management_port_fixed_frame_len;
>   	u16 rxmatch_config_base;
>   	u16 pattern_ctrl_base;
> +	u32 vlan_res_vlanid;
> +	u32 vlan_res_portmask;
>   };
>   
>   /**

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément
