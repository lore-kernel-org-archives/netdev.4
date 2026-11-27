Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761209;
	b=C1Zvp0lNeIhEreJtYW+XtI0R0ka1A/bAKqOZeH1KXB4IQXbyifbvcm0cZeFWffp4X5Ud
	 nkc43pyRqVgtfjseH2TeYxT3G+tP6Hwht/Ph393M6972lFGWkFxtkHNsVdq8NgnYiO2Sz
	 Z5k9pHI6G3fVlktC08ojahzzVPuYkZhtR5XaHdwmysmlWkAz1lkDM/Ng2eN+ymjJZ1jgV
	 fsIPEF4nimaQ8039VoOpBj4ta2Ya81/GDQwBQHpBezz0pMdl6zrhL6P7owwAIGS52rkn9
	 wdwDLp37xQ1FJeiYovR26C4oGcCwrtqbl9a8bpE6mcqkVHtIaXyWct8xPcmVjtZ9mcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761209;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dS5ygjpbGcXnLl8Jw5pT0NegDxF1r6K+iha3ueXN9qQ=;
	b=uCUZ6CefbDV/oump86gIoxYb1qFI1Ug2u0SlfpgeEsYCS/s2RAHlKOjvWvoxdFt4R2f6
	 vWx9QS9yYLdqGzgKUwxee8EUKIR5/lxhJGwfd6ZDKaoKdOF6NDK4vJ2srKQXhQI3mY3p+
	 qmIaJkxlin3050EI1dVb/KCfS6JIwxUBrZtZeQ7euy7qkkpYprZnK0MQLwNlnaDV63DgF
	 tFP4vMrqH6XZys6Eplw66fq4da0WXyPlrQ5xMxQzBCx7xyGUEnQ6LVJO2swQ1ga1HY9Kb
	 +Cmpi4QCOt9KzU6Ph3xxgxZA17DUzM0V5G9WEmtlfjSDVdrqKe56VfgH/b+nhaBrFgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ny4xdCfx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D5606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ny4xdCfx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7051F000C1;
	Fri, 27 Nov 2026 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761209;
	bh=dS5ygjpbGcXnLl8Jw5pT0NegDxF1r6K+iha3ueXN9qQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ny4xdCfxAxWY39C8e7GOR3UzVl3kEpg1E5Jov7ksIIuVy/SjjuvTvxUo29M7dnq/3
	 BSlCrJ2AYAXirIwzKvPJM02jhF7AQir0STPDrDuRA1BDyy7y4iq9KodekTH6gToHPD
	 NLIVK/f4egMN/iQhVN5/2gD2/+Hc5j4je+GFe7Xyql+TkTXi6btTAoTL/ZbdNmOrZc
	 rUkUvy61v9PaWy37myrw5LhIruUpI0G/Eile5z4BIpLsajTtcBCwGoIMDRAKq+2C4m
	 leozLwyWdKC3f+jBnNgr0/nKrLDHoV4No2xH7FfaicBGjyw7GMY8S52ay25/qstiYu
	 GtZ29Pq+HpX0Q==
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Add limited ACL flow
 statistics support
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Fri, 27 Nov 2026 06:33:28 +0000
Message-ID: <179576120817.3135.17802062908132194085@kernel.org>
In-Reply-To: <20261126060127.185631-1-mmyangfl@gmail.com>
References: <20261126060127.185631-1-mmyangfl@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 9 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 7

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Counters are withheld from DROP rules on the premise that
  "FLOWSTAT only counts passed frames", but police rules, which also…
- [Medium] `yt921x_acl_stat()` always passes `jiffies` as `lastused` to
  `flow_stats_update()`, even when `diff == 0` (no new packets since the…
- [Low] Flow counters always run in packet mode, so `tc -s` always shows
  0 bytes for offloaded flower rules.
- [Low] `yt921x_acl_rule_ext_parse_flow_action()` now rejects some
  skip_sw rules based on their tc `hw_stats` setting, and the commit…
- [Low] The feature patch also changes existing code without mentioning
  it.
- [Low] The patch adds a second limited ACL hardware pool,
  `flowstats_map` with `YT921X_FLOWSTAT_NUM` = 64 entries, managed…
- [Low] `yt921x_acl_add()` initialises `use_trap` by comparing an
  unshifted `FIELD_GET()` result with a shifted `FIELD_PREP()` constant:…
- [Low] Flowstat counter IDs are returned to the software allocator even
  when the hardware update that should drop the ACL entry's reference to…
- [Low] When a counter is reused, `yt921x_acl_add()` resets it only by
  writing zeros directly to `YT921X_FLOWSTATn_STAT(statid)` via…

--

net: dsa: motorcomm: Add limited ACL flow statistics support

This commit implements .cls_flower_stats() for the yt921x switch using its
hardware flow counters. A pool of 64 counters is tracked in flowstats_map,
and a counter is only allocated to a flower rule when hardware stats are
applicable. Counters are programmed in packet mode and reported as deltas
against the last read value.

> diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
> index fc315f1d8f87b..fe6cf03a09c8e 100644
> --- a/drivers/net/dsa/motorcomm/chip.h
> +++ b/drivers/net/dsa/motorcomm/chip.h

[ ... ]

> @@ -527,6 +529,7 @@ struct yt921x_priv {
>  	u16 eee_ports_mask;
>  
>  	DECLARE_BITMAP(meters_map, YT921X_METER_NUM);
> +	DECLARE_BITMAP(flowstats_map, YT921X_FLOWSTAT_NUM);

[Severity: Low]
Should this new pool also be registered as a devlink resource?

yt921x_devlink_resources[] in devlink.c exposes "ACL" and "meters", each
with an occupancy callback, for example:

	count = bitmap_weight(priv->meters_map, YT921X_METER_NUM);

There is no entry for the 64 flow counters. Once they run out, a rule is
either rejected with "No more flowstats, but immediate HW stats requested"
or gets HW stats silently disabled. devlink resource show gives no sign of
either.

> diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
> index e3f057ed580f5..1d927a02e1153 100644
> --- a/drivers/net/dsa/motorcomm/tc.c
> +++ b/drivers/net/dsa/motorcomm/tc.c

[ ... ]

> @@ -1059,6 +1073,9 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
>  			terminal = true;
>  			break;
>  		case FLOW_ACTION_DROP:
> +			/* FLOWSTAT only counts passed frames */
> +			ruleext->stat_applicable = false;
> +

[Severity: Medium]
If the counter only sees passed frames, what happens with police rules?

The FLOW_ACTION_POLICE case sets YT921X_ACL_ACTa_METER_EN and leaves
stat_applicable alone. yt921x_meter_config() programs the meter with
YT921X_METER_CTRLc_DROP_R, so exceeding frames are dropped in hardware.

For a rule like "flower skip_sw ... action police rate X burst Y
conform-exceed drop/pipe action pass", yt921x_acl_add() allocates both a
meter and a counter. yt921x_acl_stat() then reports the counter as the
filter's packet count, with drops always 0:

	flow_stats_update(stats, aclrule->stat_pkt_mode ? 0 : diff,
			  !aclrule->stat_pkt_mode ? 0 : diff, 0,
			  jiffies, FLOW_ACTION_HW_STATS_IMMEDIATE);

If the comment is accurate, would that undercount the matched packets for
police rules, including for the police action itself? If it isn't
accurate, are drop rules being refused counters unnecessarily?

[ ... ]

> @@ -1143,7 +1161,21 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
>  			break;
>  	}
>  
> +	/* When frames are counted by software, a hardware counter would double
> +	 * count those. Do not assign a counter when !skip_sw && !redir.
> +	 */
> +	if (ruleext->stat_applicable && !cls->common.skip_sw && !redir)
> +		ruleext->stat_applicable = false;
> +	/* Do not check on !skip_sw rules: we can't stop software from
> +	 * installing them.
> +	 */
> +	if (ruleext->stat_applicable && cls->common.skip_sw &&
> +	    !flow_action_hw_stats_check(flow_action, extack,
> +					FLOW_ACTION_HW_STATS_IMMEDIATE_BIT))
> +		return -EOPNOTSUPP;

[Severity: Low]
With this check, skip_sw rules using "hw_stats delayed", or rules whose
actions use different hw_stats types, now fail with -EOPNOTSUPP. They were
accepted before this patch. Could the commit message mention this?

The check also only runs while stat_applicable is still true, and the
FLOW_ACTION_DROP case clears it. So a "skip_sw ... action drop hw_stats
immediate" rule is never validated here. yt921x_acl_add() takes the
!stat_applicable branch and installs it without a counter or any extack
warning. After that, yt921x_acl_stat() returns -EOPNOTSUPP for it.

A skip_sw accept or redirect rule with the same explicit "hw_stats
immediate" is refused in yt921x_acl_add() once the counters run out:

	if (!ruleext->r.sw_assisted && ruleext->stat_required) {
		NL_SET_ERR_MSG_MOD(extack,
				   "No more flowstats, but immediate HW stats requested");
		return -EOPNOTSUPP;
	}

Is it intended that the same explicit request is rejected in one case and
silently ignored in the other?

> @@ -1208,6 +1240,9 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
>  	yt921x_acl_rule_set_ports(&ruleext->r, ord, BIT(port));
>  	ruleext->r.tag = cls->cookie;
>  	ruleext->r.type = TC_SETUP_CLSFLOWER;
> +	/* Align with sja1105 */
> +	ruleext->r.stat_pkt_mode = true;
> +	ruleext->r.laststat = 0;

[Severity: Low]
This is the only place stat_pkt_mode is set. The counters therefore always
run in packet mode, and tc -s will always show 0 bytes for offloaded
flower rules.

As a result, the byte mode paths can never be taken: the
YT921X_FLOWSTAT_CTRL_PKT_MODE check in yt921x_acl_add() and the
stat_pkt_mode ternaries in yt921x_acl_stat().

The commit message says:

    and you must choose between byte mode and packet mode.

but it does not say which mode is used, or that byte counts are never
reported. Could the commit message state this? Is the byte mode code
needed at all?

> @@ -1281,6 +1316,45 @@ yt921x_acl_reserve(struct yt921x_priv *priv, unsigned int entscnt,
>  	return UINT_MAX;
>  }
>  
> +static int
> +yt921x_acl_stat(struct yt921x_priv *priv, enum tc_setup_type type,
> +		unsigned long tag, u16 ports_mask, struct flow_stats *stats)
> +{

[ ... ]

> +	diff = stat - aclrule->laststat;
> +	aclrule->laststat = stat;
> +	flow_stats_update(stats, aclrule->stat_pkt_mode ? 0 : diff,
> +			  !aclrule->stat_pkt_mode ? 0 : diff, 0,
> +			  jiffies, FLOW_ACTION_HW_STATS_IMMEDIATE);

[Severity: Medium]
Does passing jiffies as lastused here, even when diff is 0, mark the rule
as just used on every stats poll?

flow_stats_update() stores max(lastused, jiffies), and
tcf_action_stats_update() copies that into the actions' lastuse. As a
result, tc -s filter show would always report "used 0 sec". Anything that
ages out idle offloaded flows by lastuse while polling stats, such as OVS
tc offload, would never see these rules as idle.

cxgb4 only updates last_used when the packet count has changed, and ocelot
and lan966x pass 0. Could lastused be updated only when diff is non-zero?

[ ... ]

> @@ -1413,9 +1487,13 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
>  	}
>  
>  	if (aclrule->action[0] & YT921X_ACL_ACTa_METER_EN)
> -		clear_bit(FIELD_GET(YT921X_ACL_ACTa_METER_ID_M,
> -				    aclrule->action[0]),
> -			  priv->meters_map);
> +		__clear_bit(FIELD_GET(YT921X_ACL_ACTa_METER_ID_M,
> +				      aclrule->action[0]),
> +			    priv->meters_map);

[Severity: Low]
This isn't a bug, but this patch also changes existing code that flow
statistics does not need:

  - meters_map moves from clear_bit()/set_bit() to
    __clear_bit()/__set_bit()
  - sw_assisted in struct yt921x_acl_rule becomes a bitfield
  - "bool use_trap = false" in yt921x_acl_add() is replaced by a value
    derived from the action word

The non-atomic bitops look fine, since every meters_map user holds
priv->reg_lock. The new use_trap initialisation has no effect, because the
later if (use_trap) block only rewrites TRAP bits that a trap rule already
carries.

Could these changes be split into a separate patch, or at least mentioned
in the commit message?

> +	if (aclrule->action[0] & YT921X_ACL_ACTa_FLOWSTAT_EN)
> +		__clear_bit(FIELD_GET(YT921X_ACL_ACTa_FLOWSTAT_ID_M,
> +				      aclrule->action[0]),
> +			    priv->flowstats_map);

[Severity: Low]
Is it safe to release the counter ID here when yt921x_acl_commit() failed
earlier in yt921x_acl_del()?

	aclblk->rules[binid] = NULL;
	ret = yt921x_acl_commit(priv, entid, aclrule->mask);
	/* the kernel never rolls back on failure */

yt921x_acl_commit() writes the action word first and then does several
more register writes. Any of those later writes can fail and leave the
hardware entry still referencing statid.

The error path of yt921x_acl_add() has the same problem. If
yt921x_acl_commit() fails after writing an action word that contains
YT921X_ACL_ACTa_FLOWSTAT_EN | YT921X_ACL_ACTa_FLOWSTAT_ID(statid), the rule
is freed and statid is never marked as used.

In both cases the next yt921x_acl_add() can pick the same statid via
find_first_zero_bit(), reprogram and zero it, and attach it to a new rule.
yt921x_acl_stat() might then report the stale entry's traffic as the new
rule's. The meter IDs already have the same lifecycle, but this patch adds
it for the new flowstat resource.

[ ... ]

> @@ -1448,6 +1528,11 @@ yt921x_acl_add(struct yt921x_priv *priv,
>  	if (entid == UINT_MAX)
>  		return -EOPNOTSUPP;
>  
> +	stat_applicable = ruleext->stat_applicable;
> +	use_trap = (ruleext->r.action[2] & YT921X_ACL_ACTc_FWD_EN) &&
> +		   (FIELD_GET(YT921X_ACL_ACTc_FWD_M,
> +			      ruleext->r.action[2]) == YT921X_ACL_ACTc_FWD_TRAP);

[Severity: Low]
Can this comparison ever be true? FIELD_GET() returns the unshifted field
value, 0 to 3 for GENMASK(22, 21). YT921X_ACL_ACTc_FWD_TRAP is already
shifted:

#define  YT921X_ACL_ACTc_FWD_M			GENMASK(22, 21)
#define   YT921X_ACL_ACTc_FWD(x)			FIELD_PREP(YT921X_ACL_ACTc_FWD_M, (x))
#define   YT921X_ACL_ACTc_FWD_TRAP			YT921X_ACL_ACTc_FWD(3)

So use_trap always starts out false, even for trap rules. Should this be
(ruleext->r.action[2] & YT921X_ACL_ACTc_FWD_M) == YT921X_ACL_ACTc_FWD_TRAP
instead?

There's no runtime effect today, since the if (use_trap) block would only
rewrite TRAP bits a trap rule already has.

[ ... ]

> @@ -1467,6 +1553,43 @@ yt921x_acl_add(struct yt921x_priv *priv,
>  		}
>  	}
>  
> +	if (!stat_applicable) {
> +		statid = YT921X_FLOWSTAT_NUM;
> +	} else {

[ ... ]

> +		} else {
> +			u32 zeros[2] = {};
> +
> +			ctrl = YT921X_FLOWSTAT_CTRL_TYPE_FLOW |
> +			       YT921X_FLOWSTAT_CTRL_EN;
> +			if (ruleext->r.stat_pkt_mode)
> +				ctrl |= YT921X_FLOWSTAT_CTRL_PKT_MODE;
> +			res = yt921x_reg_write(priv,
> +					       YT921X_FLOWSTATn_CTRL(statid),
> +					       ctrl);
> +			if (res)
> +				return res;
> +
> +			res = yt921x_reg64_write(priv,
> +						 YT921X_FLOWSTATn_STAT(statid),
> +						 zeros);

[Severity: Low]
Does a direct write to the STAT register actually clear the counter?

This is the only place the driver writes a statistics count register.
YT921X_METERn_STAT is never written, and the MIB counters are cleared
through YT921X_MIB_CTRL_CLEAN.

If the FLOWSTAT count register is read-only or ignores writes, a reused
counter keeps its previous owner's total. Since
yt921x_acl_rule_ext_parse_flow() sets laststat = 0, the first
yt921x_acl_stat() call after reuse would report all of the previous rule's
packets as new traffic.

Would it be safer to read the counter at allocation and store that value
as laststat? That works whether or not the register is writable.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126060127.185631-1-mmyangfl%40gmail.com
