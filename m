Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789906;
	b=a+XP9WTzhTZ3rLDKyEZIlDjrjCEHg8nSr0oUwxmOtznAwqGbrFbWJdR2Ld4yWEvXmEsf
	 NkoOTJ2DFtvkxhMpfpyvGiq3swQhtI2zEOvPloT9Eu4jp3WUXfr38PFlxdtL39D+XXC30
	 CF+9g9bhpH+BIf3kGA1l9MhBawqZGpSutRUAPvbV52AhTIqBHkEOOnGR9thj3Mq47+jFy
	 Ad+awtu0sCuMH6Fvb4e4+pBlsWph0EurUnXqAK4oVaCOPrFwaUitPCg6bVn3jKF3cA0r/
	 6EA4tA8aiIs8xOgWGsNHK/UXxpvm1R8+EifK2K6EisSgoT2xTzxxcnZyNn3EFwUK+Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789906;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ctZSRWrZZMy13MxbtfbQBUphTOZaOpODMuYrXj3Muzo=;
	b=dNJHJ/TghY4dULq+2ySu//+5C63qylQ+VnL8UtgA9LMjKJJQdjEmBSVimXRiQZD1P918
	 ez8fls0K7aLV9jQKV4lO4FLbRL5V0a/Jdpcwvz8xswMur+iDwh6S/Z6g3YliV0hMID7mA
	 bitpkCxezyZCacoo3ly9ypUcMdFZ1xQQsLJ8SZFAHtCLAN4gDdHj23xxqyCcETIVPJDrQ
	 riaWqgMlpSPIS/4riQtcGgIuoGdkviXtahWH8Lpn/hiBecrseWZrb/KwWDm2dAXl2vQ9p
	 ERdIbKdsWT8q49bN9rBhK53g/BN5z0/YhDnrxKUQcLwXE/V7gxdz8BwbtUoWjw7ZOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBEsriqu;
	arc=none smtp.remote-ip=95.215.58.154
Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5BF606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A5BF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBEsriqu
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G+X74yAedzt/K4RCiUDrNtK1i7drT5QJjzIXNFk4vww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794789903; v=1; x=1795394703;
 b=IBEsriquxLQpHaiQoo7fJyBU3Hl2c37GSs5Fz75e3PxPCbQNnrwWNEdPIcRJoHHBoghqE1v5
 p6EJRjcRrkFgC1yHDgwtAKkrp4yRSC0pI+CdPcmh5JbYjkOwgrj0BnJIXUk9CpluIJj1oT//jTV
 gLssOFaUmoTgOm3AyfSN07tU=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 27cf97a24d1aab7b;
	Mon, 16 Nov 2026 00:45:02 +0000
X-Mizu-Trace-ID: 27cf97a24d1aab7b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 08:44:56 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	1342116488@qq.com
Subject: Re: [PATCH net v3] team: validate the length of U32 and S32 option
 data
Message-ID: <avpSCLnDT69U4ei9@fedora>
References: <20261113090108.175889-1-sunwenbo@cmss.chinamobile.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113090108.175889-1-sunwenbo@cmss.chinamobile.com>

On Fri, Nov 13, 2026 at 05:01:08PM +0800, Wenbo Sun wrote:
> In team_nl_options_set_doit(), the policy for TEAM_ATTR_OPTION_DATA in
> team_attr_option_nl_policy is NLA_BINARY because the payload layout
> varies with the option type.
> 
> For TEAM_OPTION_TYPE_U32 and TEAM_OPTION_TYPE_S32, the payload is
> read directly with nla_get_u32(attr_data) and nla_get_s32(attr_data)
> without checking its attribute length. When userspace supplies a
> truncated attribute (0 to 3 bytes), nla_get_u32() or nla_get_s32()
> performs an out-of-bounds read past the attribute buffer. Conversely,
> oversized payloads (> 4 bytes) would also have trailing bytes
> silently ignored instead of being rejected as invalid input.
> 
> Validate that nla_len(attr_data) equals sizeof(u32) or sizeof(s32)
> for TEAM_OPTION_TYPE_U32 and TEAM_OPTION_TYPE_S32 respectively, and
> return -EINVAL otherwise, consistent with how NLA_U32/NLA_S32
> attributes are validated and similar to commit 5bef3ac184b5 ("team:
> better TEAM_OPTION_TYPE_STRING validation").
> 
> This issue was identified with the assistance of an LLM-based code
> review of Netlink option handlers in the team driver, confirmed by
> sending malformed U32 (notify_peers_count) and S32 (priority) option
> attributes on a UML kernel, and verified after the patch that
> invalid lengths (0..3, 5, and 8 bytes) are rejected with -EINVAL while
> valid 4-byte options still work as expected.
> 
> Built with W=1 on UML, x86_64 allmodconfig, and x86_64 allyesconfig with
> zero new warnings or errors.
> 
> Fixes: 3d249d4ca7d0 ("net: introduce ethernet teaming device")
> Fixes: 69821638b274 ("team: add signed 32-bit team option type")
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
> ---
> 
> Changes in v3:
> - Add Fixes: 69821638b274 ("team: add signed 32-bit team option type") for
>   the TEAM_OPTION_TYPE_S32 check, as suggested by Hangbin Liu.
> - Rebase onto latest mainline (7e1392a42ea2) with no functional code
>   changes.
> - Link to v2: https://lore.kernel.org/r/20261112090030.172342-1-sunwenbo@cmss.chinamobile.com
> 
> Changes in v2:
> - Check exact length (!= sizeof(u32) / != sizeof(s32)) instead of
>   only rejecting truncated payloads (<), as suggested by Hangbin Liu.
> - Extended the UML test to also cover oversized option payloads.
> - Link to v1: https://lore.kernel.org/r/20261111085924.360720-1-sunwenbo@cmss.chinamobile.com
> 
>  drivers/net/team/team_core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
> index cfb833c307c1..65ac25e97ae3 100644
> --- a/drivers/net/team/team_core.c
> +++ b/drivers/net/team/team_core.c
> @@ -2834,6 +2834,10 @@ int team_nl_options_set_doit(struct sk_buff *skb, struct genl_info *info)
>  			ctx.info = opt_inst_info;
>  			switch (opt_type) {
>  			case TEAM_OPTION_TYPE_U32:
> +				if (nla_len(attr_data) != sizeof(u32)) {
> +					err = -EINVAL;
> +					goto team_put;
> +				}
>  				ctx.data.u32_val = nla_get_u32(attr_data);
>  				break;
>  			case TEAM_OPTION_TYPE_STRING:
> @@ -2853,6 +2857,10 @@ int team_nl_options_set_doit(struct sk_buff *skb, struct genl_info *info)
>  				ctx.data.bool_val = attr_data ? true : false;
>  				break;
>  			case TEAM_OPTION_TYPE_S32:
> +				if (nla_len(attr_data) != sizeof(s32)) {
> +					err = -EINVAL;
> +					goto team_put;
> +				}
>  				ctx.data.s32_val = nla_get_s32(attr_data);
>  				break;
>  			default:
> -- 
> 2.33.0
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
