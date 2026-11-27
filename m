Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799938;
	b=NXfMGvDkGcGKBgixS7lmkrsYLh8iSXyNiH6IH4tx0z4BS3wpXnRmoFYWz04kMGYouPPb
	 3FowupbxXTSudM0x9puenI/zU8GvVax169/DQlcwZfYVMKcpd5PyCwR7qcDfSG3wMHnNg
	 uotOp4IMdUig2xIMcFi+bXEM8nB+vKtVbAwDjlY8gjoEd/5FvHVOtpgdop+hameoQea1s
	 io2HAEI1Zc6Rwh0HHqdbrSeZHMX6y9+PixZ/vbNzs0CwOkViwUqThWMTjojhj0kvRRaWi
	 uAnKzuZArLEVXYKh6Q9R/lAGwUZ0/b9SigN4WK8UOYLtaXflemKVVL5dfTzXUIBFaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799938;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=dZvMUU2GjeFWbrMN7sQhu0I3uEc6hhhAvfg4JOjpRyc=;
	b=2Z2Alp1yAFTGSJ8xeHoWjSYGA2w4M1r9Z8F2tz8n9hfErcRdNVxOeOar6fbdfWAJTph5
	 2yvMfVEyitegwUa++ezWp16Fm23mKs1sBnqgkp644u3I11HPNGhwoaZX2NC40lTJBpe9S
	 1pDYw5t4H8mdZv81wV6EA7zIkVg/f3kE5qh36eOlNfV0dz/UO+Kgb1rhiNkNPpmn39rsA
	 1uibPvEctbH1MSAdaHvvsfCFoq+nmEq1/T634jMNBQfUctXYRr9YQuegoEU9mB0DdMSPU
	 Yk1WPSS53j/tttdvCf44Q1JQB08uHYSAaw/Myte2OVkZi58+dnkCW54yNHwSIpoWyBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m9R3MYwm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qH3UYYPh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m9R3MYwm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qH3UYYPh;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C28606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m9R3MYwm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qH3UYYPh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m9R3MYwm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qH3UYYPh
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B10A01F46E;
	Fri, 27 Nov 2026 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795799935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dZvMUU2GjeFWbrMN7sQhu0I3uEc6hhhAvfg4JOjpRyc=;
	b=m9R3MYwmOMbdyX8YVH8hsK073zInNuKKVPd442XOWG8AGCXfmgtYwaVIM+MwkwcVekIBFn
	Ut7Goj/u15tkagwJ6D3Vxl1Jmwjj/xOBnNx/k6jvP9h8iXNqsIrBYQ8ovZZK+4EY3UUwg2
	uopgpk5Xg3PoF2RitGoN7LlDz/lNIb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795799935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dZvMUU2GjeFWbrMN7sQhu0I3uEc6hhhAvfg4JOjpRyc=;
	b=qH3UYYPhy5vmqWRQ5KzlcNjUHcdqObLSPO0FvGdpoFqrAP+E1IljTY0fPZ5T0V0HpAjIz2
	kqbKQ3AMJAaVFEBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795799935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dZvMUU2GjeFWbrMN7sQhu0I3uEc6hhhAvfg4JOjpRyc=;
	b=m9R3MYwmOMbdyX8YVH8hsK073zInNuKKVPd442XOWG8AGCXfmgtYwaVIM+MwkwcVekIBFn
	Ut7Goj/u15tkagwJ6D3Vxl1Jmwjj/xOBnNx/k6jvP9h8iXNqsIrBYQ8ovZZK+4EY3UUwg2
	uopgpk5Xg3PoF2RitGoN7LlDz/lNIb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795799935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dZvMUU2GjeFWbrMN7sQhu0I3uEc6hhhAvfg4JOjpRyc=;
	b=qH3UYYPhy5vmqWRQ5KzlcNjUHcdqObLSPO0FvGdpoFqrAP+E1IljTY0fPZ5T0V0HpAjIz2
	kqbKQ3AMJAaVFEBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0563713432;
	Fri, 27 Nov 2026 17:18:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Yb1MH67CWuMAwAAD6G6ig
	(envelope-from <fmancera@suse.de>); Fri, 27 Nov 2026 17:18:54 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: [PATCH net-next v4 00/16] Allow compiling an IPv6-only kernel network stack
Date: Fri, 27 Nov 2026 18:17:45 +0100
Message-ID: <20261127171824.27362-1-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80

The primary goal of this patch series is to enable the compilation of an
IPv6-only kernel by decoupling the core networking infrastructure from
the IPv4 protocol.

Historically, IPv4 has been intertwined with the generic socket and
transport layers. By untangling these dependencies, this series allows
systems to be built with CONFIG_IPV4 disabled. This configuration
targets strict IPv6-only deployments, constrained environments, and
specialized appliances where removing the IPv4 subsystem reduces the
network attack surface. To provide some numbers, 0.3% (32) of the
released CVEs since 2025 were strictly related to IPv4 code. While the
number is low, it is good for users to be able to disable it if they do
not depend on it.

To achieve this, subsystems with hard dependencies on IPv4 were modified
to use conditional compilation guards. When CONFIG_IPV4 is disabled, the
affected packet manipulation routines and routing hooks evaluate to
stubs returning standard error codes. The INDIRECT_CALL_INET macros
within the transport layer were adapted to safely bypass IPv4 function
pointers without penalizing the dual-stack fast paths. In addition,
there has been several code splits for UDP, RAW, ICMP or Ping isolating
the IPv4 specific code.

Every Kconfig symbol that gained a new depends on IPV4 was audited
against the code it guards, distinguishing genuine hard link-time
dependencies from options that were only conservatively gated.  Where a
symbol never depended on CONFIG_INET before, depends on IPV4 || !INET is
used instead of a bare dependency, so pre-existing CONFIG_INET=n
configurations remain buildable as before.

Finally, CONFIG_IPV4 is exposed in Kconfig as an explicit boolean,
defaulting to 'y' to preserve existing configurations.

The bloat-o-meter diff and size output for x86_64 with dualstack and
IPv6 disabled:

   text	   data	    bss	    dec	    hex	filename
31608053	8913174	1145484	41666711	27bc897	vmlinux.dual
28809691	8183494	1101724	38094909	245483d	vmlinux.ipv6

add/remove: 53/19751 grow/shrink: 65/601 up/down: 740100/-3490467 (-2750367)

Performance testing:

Basic TCP performance validation was conducted using iperf3 on an AMD
Ryzen 9 9950X between two bridged virtual machines. These benchmarks
verify that there are no obvious performance regressions.

Kernel / Configuration            Traffic Type    Offloads ON     Offloads OFF
==============================================================================
net-next (Dual-Stack Baseline)     IPv4            20.8 Gbps       7.22 Gbps
net-next (Dual-Stack Baseline)     IPv6            20.4 Gbps       7.55 Gbps
net-next (IPv4-Only Baseline)      IPv4            20.9 Gbps       7.86 Gbps
Patched (Dual-Stack)               IPv4            21.8 Gbps       7.77 Gbps
Patched (Dual-Stack)               IPv6            21.7 Gbps       7.35 Gbps
Patched (IPv4-Only)                IPv4            20.9 Gbps       7.91 Gbps
Patched (IPv6-Only)                IPv6            21.1 Gbps       8.06 Gbps

Follow-up for this series:

Future work decoupled from this initial series includes expanding
Kconfig adaptations across remaining kernel subsystems to support an
IPv6-only environment. This includes patches for network bonding modes
that assume dual-stack availability and analyze Netfilter nftables
expressions and connection tracking to ensure pure IPv6 operations are
fully independent.

The main structural cost of this series is the code movement from
splitting IPv4-specific logic into new files, which will make git blame
and bisection across the affected files more cumbersome than a purely
additive change. Where possible, IPv4-only branches were expressed as
runtime IS_ENABLED() checks relying on dead-code elimination rather than
ifdef blocks, to keep the preprocessor-guard footprint as small as
possible.

The sparse warnings in tcp_sk_init() and tcp_sk_exit() come from the
existing code that accesses net->ipv4.tcp_congestion_control, which is
declared __rcu, without RCU accessors. This series only moves those
functions from tcp_ipv4.c to tcp.c and does not change them. The same
lines exist in tcp_ipv4.c upstream, so the report treats them as new
only because they now sit in a different file. Fixing the annotations
would be a functional change unrelated to this series, so I'd rather
keep this change a pure move and handle it in a separate patch.

Changes:
  v4:
    Patch 1: Mark SUNVNET_COMMON and QETH_L3 as depends on IPV4 too
    Patch 2: Return -ENOPROTOOPT from the ip_setsockopt()/ip_getsockopt()
             stubs. Keep INDIRECT_CALL_INET_1() gated on CONFIG_INET so the
             direct TCP calls remain on IPv6-only kernels. Return NULL from
             the ip_finish_skb() stub, name the net parameter in the
             ip_route_output_flow() stub, and don't fail SIOCGIFCONF early
             when IPV4=n. Reworded the commit message
    Patch 3: Move ip_send_check() to af_inet.c and drop the
             inet_gso_segment() guard so IPv4 GSO keeps working for
             forwarded or bridged packets. Call inet_initpeers() for IPv6
             too. Reworded the commit message
    Patch 4: Keep the BPF TCP iterator types local to tcp.c. Reworded the
             commit message
    Patch 5: Removed the duplicated struct raw_frag_vec from raw.c.
             Included missing <linux/export.h>
    Patch 6: Stub udp4_lib_lookup_skb() and drop the udp4_gro_complete()
             guard so merged IPv4 UDP GRO packets are not dropped
    Patch 7: Mark icmp_init_ipv4() as __init
    Patch 9: Fixed the section comments in ip_fib.h
    Patch 11: Keep fib_multipath_hash_seed available when IPV4=n, as the
              IPv6 datapath uses it too
    Patch 15: Don't report CIPSOv4 in the NetLabel protocols dump when
              CIPSO=n

  v3: https://lore.kernel.org/netdev/20260930135334.4739-1-fmancera@suse.de/

  v2: https://lore.kernel.org/netdev/20260928193046.6698-1-fmancera@suse.de/

Fernando Fernandez Mancera (16):
  ipv4: introduce CONFIG_IPV4 to decouple the IPv4 stack
  net: core: add IPv4 fallback stubs and guards for CONFIG_IPV4=n
  net: inet: relocate ip_generic_getfrag and guard IPv4 socket logic
  tcp: move protocol agnostic TCP functions out of tcp_ipv4.c
  ipv4: raw: split IPv4 specific logic into raw_ipv4.c
  ipv4: udp: split IPv4 specific logic into udp_ipv4.c
  ipv4: icmp: split IPv4 specific logic into icmp_ipv4.c
  ipv4: ping: split IPv4 specific logic into ping_ipv4.c
  ipv4: fib: split common nexthop logic to fib_core.c
  tunnels: guard IPv4 tunnel functions with CONFIG_IPV4
  ipv4: disable IPv4-only sysctls when CONFIG_IPV4=n
  netfilter: ipv4: guard ip_route_me_harder() with CONFIG_IPV4
  net: bridge: guard ARP/RARP proxy and suppression with CONFIG_IPV4
  wifi: mac80211: replace CONFIG_INET with CONFIG_IPV4 guards
  netlabel: cipso: introduce CONFIG_CIPSO to decouple IPv4 dependency
  ipv4: make CONFIG_IPV4 boolean

 drivers/infiniband/Kconfig                    |    2 +-
 drivers/infiniband/sw/rxe/Kconfig             |    2 +-
 drivers/net/Kconfig                           |   23 +-
 drivers/net/ethernet/chelsio/Kconfig          |    2 +-
 drivers/net/ethernet/intel/Kconfig            |    2 +
 drivers/net/ethernet/marvell/prestera/Kconfig |    1 +
 .../net/ethernet/mellanox/mlx5/core/Kconfig   |    3 +-
 drivers/net/ethernet/mellanox/mlxsw/Kconfig   |    1 +
 drivers/net/ethernet/qlogic/Kconfig           |    2 +
 drivers/net/ethernet/rocker/Kconfig           |    1 +
 drivers/net/ethernet/sfc/Kconfig              |    1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |    1 +
 drivers/net/ethernet/sun/Kconfig              |    2 +-
 drivers/net/ethernet/via/Kconfig              |    1 +
 drivers/net/ppp/Kconfig                       |    1 +
 .../broadcom/brcm80211/brcmfmac/Kconfig       |    1 +
 drivers/net/wireless/intel/iwlwifi/Kconfig    |    1 +
 drivers/nvme/host/Kconfig                     |    2 +-
 drivers/nvme/target/Kconfig                   |    2 +-
 drivers/s390/net/Kconfig                      |    1 +
 drivers/scsi/cxgbi/cxgb3i/Kconfig             |    2 +-
 drivers/scsi/cxgbi/cxgb4i/Kconfig             |    2 +-
 drivers/target/iscsi/Kconfig                  |    2 +-
 drivers/target/iscsi/cxgbit/Kconfig           |    2 +-
 fs/Kconfig                                    |    1 +
 fs/afs/Kconfig                                |    2 +-
 fs/nfs/Kconfig                                |    2 +-
 fs/nfsd/Kconfig                               |    2 +-
 include/linux/indirect_call_wrapper.h         |    6 +-
 include/linux/inetdevice.h                    |    2 +-
 include/net/cipso_ipv4.h                      |   18 +-
 include/net/icmp.h                            |    1 +
 include/net/ip.h                              |  111 +-
 include/net/ip_fib.h                          |   29 +-
 include/net/route.h                           |   14 +-
 include/net/tcp.h                             |    3 +-
 include/net/udp.h                             |   18 +
 net/Kconfig                                   |    9 +-
 net/batman-adv/Kconfig                        |    6 +-
 net/bridge/Kconfig                            |    2 +-
 net/bridge/br_arp_nd_proxy.c                  |    2 +
 net/bridge/br_device.c                        |    2 +-
 net/bridge/br_input.c                         |    2 +-
 net/bridge/netfilter/Kconfig                  |    3 +-
 net/core/Makefile                             |    2 +-
 net/core/fib_core.c                           |  307 +++
 net/core/filter.c                             |   20 +-
 net/core/neighbour.c                          |    4 +
 net/ipv4/Kconfig                              |   29 +-
 net/ipv4/Makefile                             |   24 +-
 net/ipv4/af_inet.c                            |  139 +-
 net/ipv4/fib_frontend.c                       |   96 -
 net/ipv4/fib_semantics.c                      |  205 --
 net/ipv4/icmp.c                               | 1421 +------------
 net/ipv4/icmp_ipv4.c                          | 1451 +++++++++++++
 net/ipv4/inet_connection_sock.c               |    2 +-
 net/ipv4/inet_hashtables.c                    |    3 +
 net/ipv4/ip_output.c                          |   27 -
 net/ipv4/ip_tunnel_core.c                     |   11 +
 net/ipv4/netfilter.c                          |    3 +
 net/ipv4/netfilter/Kconfig                    |    2 +-
 net/ipv4/nexthop.c                            |    5 +-
 net/ipv4/ping.c                               |  210 +-
 net/ipv4/ping_ipv4.c                          |  228 +++
 net/ipv4/proc.c                               |   45 +-
 net/ipv4/raw.c                                |  863 --------
 net/ipv4/raw_diag.c                           |    3 +-
 net/ipv4/raw_ipv4.c                           |  886 ++++++++
 net/ipv4/sysctl_net_ipv4.c                    |  415 ++--
 net/ipv4/tcp.c                                | 1334 +++++++++++-
 net/ipv4/tcp_bpf.c                            |    3 +-
 net/ipv4/tcp_ipv4.c                           | 1328 +-----------
 net/ipv4/udp.c                                | 1818 +----------------
 net/ipv4/udp_bpf.c                            |    5 +-
 net/ipv4/udp_ipv4.c                           | 1793 ++++++++++++++++
 net/ipv6/Kconfig                              |   17 +-
 net/ipv6/af_inet6.c                           |    5 +
 net/ipv6/datagram.c                           |    4 +-
 net/ipv6/netfilter/Kconfig                    |    2 +-
 net/ipv6/tcp_ipv6.c                           |   23 +-
 net/ipv6/udp.c                                |   11 +-
 net/l2tp/Kconfig                              |    2 +-
 net/mac80211/main.c                           |   10 +-
 net/mptcp/Kconfig                             |    2 +-
 net/netfilter/Kconfig                         |    2 +-
 net/netfilter/ipset/Kconfig                   |    2 +-
 net/netfilter/ipvs/Kconfig                    |    2 +-
 net/netlabel/Kconfig                          |    4 +
 net/netlabel/Makefile                         |    2 +-
 net/netlabel/netlabel_cipso_v4.h              |    7 +
 net/netlabel/netlabel_kapi.c                  |    3 +
 net/netlabel/netlabel_mgmt.c                  |    3 +-
 net/rds/Kconfig                               |    1 +
 net/rxrpc/Kconfig                             |    2 +-
 net/sched/Kconfig                             |    2 +-
 net/sctp/Kconfig                              |    2 +-
 net/smc/Kconfig                               |    2 +-
 net/sunrpc/Kconfig                            |    2 +-
 net/tipc/Kconfig                              |    1 +
 net/xfrm/Kconfig                              |   10 +-
 100 files changed, 6790 insertions(+), 6310 deletions(-)
 create mode 100644 net/core/fib_core.c
 create mode 100644 net/ipv4/icmp_ipv4.c
 create mode 100644 net/ipv4/ping_ipv4.c
 create mode 100644 net/ipv4/raw_ipv4.c
 create mode 100644 net/ipv4/udp_ipv4.c

-- 
2.56.1

