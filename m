Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411834;
	b=BBcPc13/bk1st7jjPNZyjAOB3qOnXmTC1O0BZAYF9g/9uLRCsiyUj8JBkQjLsnJei2kN
	 +CP7L5BK9OctEvGHqtULf7xoEw9JxfPnEsxqEees2QL3zQB7FVISuOvfzVrpMA6fsFgtv
	 j2IGdZeLTBBEAm41UuBq909b+z5pL3yGmOPDPOkZZzCXmTveNBMyFUt7dmP9URhJkNTWT
	 z880AFDr8ZYfPRYrKFR4/ceuDd4lg1r6F6fOgzN9G+rX300x7RJM71Y8KkgSRnDqLy+o8
	 4GW+wWxYmUTsxBDbwBpTXwf90L6/pezJcqPjniTMAJGkl4QG+Mbc34tC00cis3KcZGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pKSesgKdX6o34+QSNK/jO/Zds2gG+uf3AUg9lMtiNlA=;
	b=M6NvMLU3+WCHD/he4OAt/TOGtf0sS/vmMNgSJOIcuoeyejqshJbjuF42w7AGaE/o8mkz
	 LHVq3qMo+yOh0hbVrE0q6id9W4wANWCAJNHiyKTjCFQga4uESIRJg2vdc0g4aYXK4fIjM
	 IWlISCN67S377QHgCdt+ZIjnHRTNfj85F5jc/nVimd3sqhrRvbVVHhng988oT0VVAPVQN
	 PB3aRevgB7mY9jFAdUbHHaCxK85QTPUlraF6EnyZs6SuYkAZ2JqLFuRG8luRKOjZGd48P
	 rz29D4nex1Rf/d6OjnT4Yyw/k0UGtheWoTBi2y8ti5Zsy5pMamYl8VmvOHZjw9/uSfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0DIK/+8M";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29AD606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DIK/+8M
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3712b6d9843so2374955eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411833; x=1796016633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKSesgKdX6o34+QSNK/jO/Zds2gG+uf3AUg9lMtiNlA=;
        b=0DIK/+8Mgw5NwaqLN9Ss3OZF+nxEzWuFTS5aAEDxhzByGpDghh4VUQibhzAYPv2Brt
         Ta2s/BEyxwakZhqXK2W7hHvHFUvVPNoXkRyHwkhvNYu/Pojw1h9OsVFHrYOfXxBSt+RB
         e1Ce26de3DW64z04qE7+EXCWhK3BDhRF7obxBhhja7Vr7oL8RzBrI5svwhqjelFfgKa8
         gGmieqMWpJKTQ6fGoj3n4NKQq/aJwKQUPcS0oBL/j8TQGWRQNVYHR8qc6pEOT8hOwv94
         K6t2ZBWWwh8DVdX561q2WDaFG282BBJGGWHt9Lea4HmYzgbtJZ53zJHGF25Xj23aAaeZ
         U8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411833; x=1796016633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKSesgKdX6o34+QSNK/jO/Zds2gG+uf3AUg9lMtiNlA=;
        b=DdBhbXIuCo1TBPzyRk9Cokezb908Psk7dJMMxRNXv6GwV/BIXcms/LEEV16PPtqoSF
         13kN3nxwq2f9rdjDnpTpm2+6bNHYmYZVH4iQKe3VPrLNTPXKvL58SEoUFWqHPN8S9FrB
         gWBxBHVcw3hlVMRdN6dmPg1MaQsgndOVzqIeZy21bAbi+Zug0DdZyC/PBZfKfqBoKjSN
         4VK1PDALdDj9bKifRxqmg2Rn0MRXeCx1f9ilhQdvXgqWkSWuG9q8tBNTo1jbuxKMuBM8
         kTxtIW7xIqPARjsg86bGKyFPHhh9PY7Rb/h1j+oOl7ri4PB+gQh3+FggMDDkGoGf7Twm
         62yw==
X-Gm-Message-State: APuU4Z8oELaVXW/qEm4t6AfuGHOdm+qjuBMShklmLFesxOGZLNBeI4hG
	e0dxvvRkbHOGwQmUpziJH75xtpH7WH9IodFDmtbJqI4DzYorYciKmS9BqpLxExG7Fl0=
X-Gm-Gg: AZFdTZdpDLxnN4b5rY7cSiBMUuYYhEqtKybGoIykJGHHgg2PWxAaMFlPkUaatH3NB8Q
	CD5r37R+GMQUQDvVtPOpJUggJkSG0DbM5jbPDo82jqfWb0WMDwyohqpU3i5MFkImD9K1M7FW1za
	HPY7Hq7ZwZsBJil1fAUBNOtdtexu5om8QoW5gjNlrLrLkGRY1UyYiG9i0neEGjsaYbNAmZlnQhB
	E7CsJihbKAWFoqP2ZJX8XzcoXIElDwavzgXWZyF0p5iFg/1IRxpb+KAstgK2go4u8M07qJzNXfE
	8eQi+blgjpLW7P9oNxtojAXNZibZzFCM51N8p90k9qlX3ILONwvYPeMl8CfWrKJBA0KcCYAspHa
	uySrndsMVkb/AjqZYMZBqXMzVF+mcbKp/2UCszKVQ5vlb6VOOU6jU9YwbZCEFzbSEZgbAzkQQiz
	+fa1kGc7lm9Vuv/nVSJPHH6QiAY3gQYsJkngQJO83bXxER/HJljNLdVBrNI6tzReboNnucVmZfS
	cJsqCO+Uf4wJcUn9ttEdo3xg1II5yzXpgVjdKZ9uJC2uXLorCRHvRW6G57JKrWdxU/l31fHKVbx
	0bYxsKFtIow2KkYranGH9y7TGCKOmr0qo6QFT2wbqdn3Rjae4e90r61xeTo60S+Nzg==
X-Received: by 2002:a05:7300:1c1b:b0:386:9d31:2d18 with SMTP id 5a478bee46e88-3869d313208mr6562739eec.0.1795411832560;
        Sun, 22 Nov 2026 21:30:32 -0800 (PST)
Received: from ptathe-thinkpadt14gen4.rmtin.csb ([2401:4900:1c17:49db:63b5:cf7d:da25:ff37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm29924212eec.29.2026.11.22.21.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:32 -0800 (PST)
From: Pranav Tathe <pranavtathe30@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Pranav Tathe <pranavtathe30@gmail.com>
Subject: [PATCH iproute2-next v2] ip-link: document BOND type options in man page
Date: Mon, 23 Nov 2026 10:59:39 +0530
Message-ID: <20261123052939.24023-1-pranavtathe30@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110142527.257436-1-pranavtathe30@gmail.com>
References: <20261110142527.257436-1-pranavtathe30@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ip-link(8) man page documents master-side creation options for many
link types but has no "BOND Type Support" section, leaving the bond master
options (mode, miimon, arp_*, xmit_hash_policy, lacp_*, ad_*,
coupled_control, broadcast_neighbor, lacp_strict, arp_missed_max, ...)
undocumented, even though a "Bonding Slave Support" section already exists.

Add a "BOND Type Support" section modelled on "BRIDGE Type Support",
describing every bond master option accepted by iplink_bond.c. Option
descriptions are sourced from the kernel bonding documentation
(Documentation/networking/bonding.rst).

Signed-off-by: Pranav Tathe <pranavtathe30@gmail.com>
---
v2: trim each option description to one line, drop restated defaults and
    valid ranges, and add a pointer to the kernel bonding documentation
    after the synopsis (per Stephen Hemminger's review). Synopsis and
    option list unchanged.

 man/man8/ip-link.8.in | 282 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/man/man8/ip-link.8.in b/man/man8/ip-link.8.in
index 719781bd..3c3a9afd 100644
--- a/man/man8/ip-link.8.in
+++ b/man/man8/ip-link.8.in
@@ -1764,6 +1764,288 @@ Redundancy Protocol (PRP).
 .
 .in -8
 
+.TP
+BOND Type Support
+For a link of type
+.I BOND
+the following additional arguments are supported:
+
+.BI "ip link add " DEVICE " type bond "
+[
+.BI mode " BONDMODE "
+] [
+.BI active_slave " SLAVE_DEV "
+] [
+.B clear_active_slave
+] [
+.BI miimon " MIIMON "
+] [
+.BI updelay " UPDELAY "
+] [
+.BI downdelay " DOWNDELAY "
+] [
+.BI peer_notify_delay " DELAY "
+] [
+.BI use_carrier " USE_CARRIER "
+] [
+.BI arp_interval " ARP_INTERVAL "
+] [
+.BI arp_validate " ARP_VALIDATE "
+] [
+.BI arp_all_targets " ARP_ALL_TARGETS "
+] [
+.BI arp_ip_target " [ ARP_IP_TARGET, ... ] "
+] [
+.BI ns_ip6_target " [ NS_IP6_TARGET, ... ] "
+] [
+.BI primary " SLAVE_DEV "
+] [
+.BI primary_reselect " PRIMARY_RESELECT "
+] [
+.BI fail_over_mac " FAIL_OVER_MAC "
+] [
+.BI xmit_hash_policy " XMIT_HASH_POLICY "
+] [
+.BI resend_igmp " RESEND_IGMP "
+] [
+.BI num_grat_arp|num_unsol_na " NUM_PEER_NOTIF "
+] [
+.BI all_slaves_active " ALL_SLAVES_ACTIVE "
+] [
+.BI min_links " MIN_LINKS "
+] [
+.BI lp_interval " LP_INTERVAL "
+] [
+.BI packets_per_slave " PACKETS_PER_SLAVE "
+] [
+.BI tlb_dynamic_lb " TLB_DYNAMIC_LB "
+] [
+.BI lacp_rate " LACP_RATE "
+] [
+.BI lacp_active " LACP_ACTIVE "
+] [
+.BI coupled_control " COUPLED_CONTROL "
+] [
+.BI broadcast_neighbor " BROADCAST_NEIGHBOR "
+] [
+.BI ad_select " AD_SELECT "
+] [
+.BI ad_user_port_key " PORTKEY "
+] [
+.BI ad_actor_sys_prio " SYSPRIO "
+] [
+.BI ad_actor_system " LLADDR "
+] [
+.BI lacp_strict " LACP_STRICT "
+] [
+.BI arp_missed_max " MISSED_MAX "
+]
+
+The options below mirror the bonding driver parameters. For their
+full semantics, permitted values and defaults see the kernel
+bonding documentation,
+.B Documentation/networking/bonding.rst
+in the Linux kernel source tree, or
+.B https://www.kernel.org/doc/html/latest/networking/bonding.html
+\&.
+
+.in +8
+.sp
+.BI mode " BONDMODE "
+- specifies the bonding policy. Possible values are
+.BR balance-rr " (0), " active-backup " (1), " balance-xor " (2), "
+.BR broadcast " (3), " 802.3ad " (4), " balance-tlb " (5) and "
+.BR balance-alb " (6). "
+
+.BI active_slave " SLAVE_DEV "
+- sets the active slave in
+.BR active-backup ", " balance-alb " and " balance-tlb " modes. "
+.I SLAVE_DEV
+is the name of an existing slave interface.
+
+.B clear_active_slave
+- clears the active slave, letting the bonding driver select one on its
+own.
+
+.BI miimon " MIIMON "
+- specifies the MII link monitoring frequency in milliseconds. A
+value of zero disables MII link monitoring.
+
+.BI updelay " UPDELAY "
+- time in milliseconds to wait before enabling a slave after a link
+recovery. Only valid for the
+.I miimon
+link monitor.
+
+.BI downdelay " DOWNDELAY "
+- time in milliseconds to wait before disabling a slave after a link
+failure. Only valid for the
+.I miimon
+link monitor.
+
+.BI peer_notify_delay " DELAY "
+- delay in milliseconds between each peer notification issued after a
+failover event.
+
+.BI use_carrier " USE_CARRIER "
+- obsolete; link state is always determined with
+.BR netif_carrier_ok ().
+
+.BI arp_interval " ARP_INTERVAL "
+- specifies the ARP link monitoring frequency in milliseconds. A value
+of 0 disables ARP monitoring.
+
+.BI arp_validate " ARP_VALIDATE "
+- specifies whether ARP probes and replies are validated and whether
+non-ARP traffic is filtered for link monitoring. Possible values are
+.BR none " (0), " active " (1), " backup " (2), " all " (3), "
+.BR filter " (4), " filter_active " (5) and " filter_backup " (6). "
+
+.BI arp_all_targets " ARP_ALL_TARGETS "
+- specifies how many
+.I arp_ip_target
+addresses must be reachable for the ARP monitor to consider a slave up.
+Possible values are
+.BR any " (0) and " all " (1). "
+
+.BI arp_ip_target " [ ARP_IP_TARGET, ... ] "
+- IPv4 addresses to use as ARP monitoring peers, separated by commas.
+
+.BI ns_ip6_target " [ NS_IP6_TARGET, ... ] "
+- IPv6 addresses to use as NS/NA monitoring peers, separated by commas.
+
+.BI primary " SLAVE_DEV "
+- specifies the primary slave for
+.BR active-backup ", " balance-tlb " and " balance-alb " modes. "
+.I SLAVE_DEV
+is the name of an existing slave interface.
+
+.BI primary_reselect " PRIMARY_RESELECT "
+- specifies the reselection policy for the primary slave. Possible values
+are
+.BR always " (0), " better " (1) and " failure " (2). "
+
+.BI fail_over_mac " FAIL_OVER_MAC "
+- specifies MAC address handling on failover in
+.B active-backup
+mode. Possible values are
+.BR none " (0), " active " (1) and " follow " (2). "
+
+.BI xmit_hash_policy " XMIT_HASH_POLICY "
+- selects the transmit hash policy for slave selection in
+.BR balance-xor ", " 802.3ad " and " tlb " modes. "
+Possible values are
+.BR layer2 ", " layer2+3 ", " layer3+4 ", " encap2+3 ", " encap3+4
+and
+.BR vlan+srcmac .
+
+.BI resend_igmp " RESEND_IGMP "
+- specifies the number of IGMP membership reports issued after a failover
+event. Useful for
+.BR balance-rr ", " active-backup ", " balance-tlb " and " balance-alb
+modes.
+
+.BI num_grat_arp|num_unsol_na " NUM_PEER_NOTIF "
+- specifies the number of peer notifications issued after a failover
+event. Both names set the same value.
+
+.BI all_slaves_active " ALL_SLAVES_ACTIVE "
+- specifies whether duplicate frames received on inactive ports are
+dropped (0) or delivered (1).
+
+.BI min_links " MIN_LINKS "
+- minimum number of links that must be active before asserting carrier.
+Only affects
+.B 802.3ad
+mode.
+
+.BI lp_interval " LP_INTERVAL "
+- seconds between learning packets sent to each slave's peer switch. Only
+affects
+.B balance-tlb
+and
+.B balance-alb
+modes.
+
+.BI packets_per_slave " PACKETS_PER_SLAVE "
+- number of packets to transmit through a slave before moving to the
+next; 0 chooses a slave at random. Only affects
+.B balance-rr
+mode.
+
+.BI tlb_dynamic_lb " TLB_DYNAMIC_LB "
+- enables (1) or disables (0) dynamic shuffling of flows in
+.B balance-tlb
+and
+.B balance-alb
+modes.
+
+.BI lacp_rate " LACP_RATE "
+- specifies the rate at which the link partner is asked to transmit
+LACPDUs in
+.B 802.3ad
+mode. Possible values are
+.BR slow " (0) and " fast " (1). "
+
+.BI lacp_active " LACP_ACTIVE "
+- specifies whether LACPDU frames are sent periodically. Possible values
+are
+.BR off " (0) and " on " (1). "
+
+.BI coupled_control " COUPLED_CONTROL "
+- specifies whether the LACP MUX keeps the Collecting and Distributing
+states coupled in
+.B 802.3ad
+mode. Possible values are
+.B off
+and
+.BR on .
+
+.BI broadcast_neighbor " BROADCAST_NEIGHBOR "
+- specifies whether ARP/ND packets are broadcast to all active slaves in
+.B 802.3ad
+mode. Possible values are
+.B off
+and
+.BR on .
+
+.BI ad_select " AD_SELECT "
+- specifies the
+.B 802.3ad
+aggregation selection logic. Possible values are
+.BR stable " (0), " bandwidth " (1), " count " (2) and " actor_port_prio " (3). "
+
+.BI ad_user_port_key " PORTKEY "
+- in an
+.B 802.3ad
+system, defines the upper 10 bits of the port key.
+
+.BI ad_actor_sys_prio " SYSPRIO "
+- in an
+.B 802.3ad
+system, specifies the system priority.
+
+.BI ad_actor_system " LLADDR "
+- in an
+.B 802.3ad
+system, specifies the actor's MAC address used in LACPDUs. The value
+cannot be a multicast address.
+
+.BI lacp_strict " LACP_STRICT "
+- specifies the fallback behavior when LACP negotiation fails on all
+slave links in
+.B 802.3ad
+mode. Possible values are
+.BR off " (0) and " on " (1). "
+
+.BI arp_missed_max " MISSED_MAX "
+- specifies the number of
+.I arp_interval
+monitor checks that must fail before the ARP monitor marks an interface
+down.
+
+.in -8
+
 .TP
 BRIDGE Type Support
 For a link of type
-- 
2.56.0

