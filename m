Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795389672;
	b=Bc30xd+LkEWG0lgIlmZ9avtNHBc6LY45I2foqC3jdcV/ZqH2pr4osEpG/vziIhMEW2Nm
	 VMW7Eor7Rxl57yKfnPgsiogu8+0U7AGHcJBLmG/il/MQqdp753dxqbAdWiFBVkiWVxlcK
	 vr46Rto78V0SFTvs0iYLNPcbF6nO7F/I5CfFumWMJvKphMA9PBoVtGzd3yBOdQuRiQnOV
	 vOM2Ihy/jgQafitGIER53oC2aQxhsMT/vys3XkQkDMhUs66296EAuMLmZEzogVnRSurVq
	 ghplFJM7zEMEmuECxnqk0zI03eFIRiZMA6KREeXUZpCC4N1/xx8iskihUYdUcYdfJCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=TTW4RGUBOIoiovq6C38P7O0ojxYjuzO+Jk/cZ+Q8iu8=;
	b=J3P2Ji8+zLBsck6fGJoiNzW3qgu7vTlffQILh0O5bpIjNYa2zsixEKTXDvy/+ABDmL7s
	 ea0jVd1IE+06w/4u93AnmCPLJtOWRhtXJYqNtCSkTuDQPiGEtokXP8ejuok3U6bM4PGpJ
	 Wbg9JiFvsz7N4j66cVr7v9Zvt2JD0FtC9ILRuuIVBlnrZv7WBLYCN5pOIlm9wKSXiZt35
	 JGjXFx3f2UEb5/qeXUfr8qlYvbSjmVtzdQ4TqomV9tkspCGp2WSgzU6ia0L0RlXnaYQEJ
	 1g5ICyKQ9FihRP3CrQwOm0tzN8sRwk/30SrxFJCFiBLe+/537YCE/9p7VYII9Ee9j7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WX6/cOb8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D538606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D538606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WX6/cOb8
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6bab1084463so85190a12.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795389670; cv=none;
        d=google.com; s=arc-20260327;
        b=emIv7kk15jGK2hzEPzAy7ueNB+hcdihmvtBYCkyNzNy6CQL9AWFKZLTDMqLuQRTJk6
         gTHkmPnIN7Ux0EtmiVOzJjTkAInjqHBzyRPRmhDFe6HSQAqukdTJlOJLuj63ooB9ds/D
         8vQV8ErnGk+U/h9ouGYKogRJ9qQ9uDyifZu/lfSPM3NllnO5BA0RC8zMOQLtwfwMzh6i
         Of/PQ5a/XMj7Rqtvo+TBaQugdazllwa8Op/3Qscq6jEJD4RX6CSsEo1VwKOX2/Tt/H64
         8+I2qc6Gxuf+d1XFiRU3xzM4J8081ftvsJ7t+M2f3xO73ntU4EtnXXrCbgh0X5x8m4Zk
         Zldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=TTW4RGUBOIoiovq6C38P7O0ojxYjuzO+Jk/cZ+Q8iu8=;
        fh=5eXKLRljkh3JQK3w0eRxcHmxBes7ZYwBKpnfSOMYgcM=;
        b=OCS0go3kdcEpg+hCbHcNarjWjiyaNygAWHn04W1r5bYWxj8VWCm0/4f5SKtuUhqpOC
         /N16R+jlE7yACV5Q7ayqFuAcxwCgl0s7atLyRNetY5KRx6RW/nD5pXu43LtwOXjGGT48
         +kHIeNNJPPl05mCa0wGoaMFq+1sIwm7lFHjNYxSuNg7pk745FuiRjIOVZJNNCU78tFCh
         /cx0YTA7PCWaUzaiHtSqCiGrHe92f1WEfF+4jELvBkL3/zBIG3BBcID9oYjAa/XbuomD
         ultkN+r+JhoxrSX01rERijM2ZdB7YXQV4Vhuv2M971WY2Qt1S6R93bwYTLyvENTgWPRf
         zOOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795389670; x=1795994470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTW4RGUBOIoiovq6C38P7O0ojxYjuzO+Jk/cZ+Q8iu8=;
        b=WX6/cOb85Pj/nH9o41AB0CPKgpxS5ig4OZdFldPMx6sHrCvHuKg5PW/yFYp1x/UtKH
         EPW/4RWGqcYkzIOSNaMoZLtUi1nA0gcYmM2zrrJKN8TdIuSDWZha5A4sUIDEo4S7BEue
         KD7MPl7oXWJMQbruRT96PpUZ/3r95KOjooWpTIeEkf/p2fvMTorhDZHHi9LyeuPRrrfL
         9d+sLSTXEy9trwuduFLq3uUVPBipgAL4az0KoRYDR1gsLiXMtJcYFgRQI+pBB2BJ9NOi
         1WIflajOvgq6CDhrsht+BqcSBk5+zAUqQ9UXFHBvLmBF+ZLnfxWe6ZnARGyhVfib8+BU
         gYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795389670; x=1795994470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TTW4RGUBOIoiovq6C38P7O0ojxYjuzO+Jk/cZ+Q8iu8=;
        b=PKTgESXo0U1Bx9xKClqmXabRa3hK/8bULGNigTC0Xh4CBpUGPngtqF4XK5BxASCprD
         OTMIXgM/5jwIYNccQ5+UdJP/XpbgmWFDz3XUTzteoR71pWW2a9EI1PG4D8MN65N2h6FX
         xqWZxsSrZpV8nfoHXJs95F14gRMP4qxMnUntc4B04Rj8RlCmkl8L+YJa2vUXLYbz29MQ
         nrkDUWMjuhETV1d2/Mz19AtUYJWlNo1rCuvNa6aznaWV0lnMLlRNhiEanTzERkF/TfdG
         cPjraZ2EYsVCt6uo1vW0GFbHN0Gm3jrB56zOhUB2C5hrwSQq8U9s3AHk0Vsgpt60PDD5
         EmCQ==
X-Gm-Message-State: APuU4Z95EYs+8bzo2XildjdIa4OU9Cp9SU5z4RvS8rYXyqJRJLp8n4bG
	n6O+h7Ns709VE+CQBhHTJtSLWCSc80GyLLutC3OxBWG0J1wD7QDHWXnu5wEqBCRE75xbbhxoMmJ
	qAOCbY49BHyneYsnKm72Ww00fEKECl/FxQcfO
X-Gm-Gg: AZFdTZcMS2a2LSpmciSOFetXLm7AtWEohfFDrmcX5XCS1fqpobY27+4HKN4GlXfhxAg
	L4KhWJkUldDXF6eg3WqFRdwcykR+FdXNq0ImWNcSLeL2d6QMc5Y+N2XDvnd1LqIQmHr5j0xM3QN
	uHuii70S3cG5Kz/TNWMjecQHQzTXZkhDJtdN/W903B+TDWTK/8wggcQz4wHv2zMrpyZXVHrHEjA
	2Cs8wdD/8KVd8szgwnuXW8Q3HM7KOmZyjhHfW66DHe44zB/wP8/g/IopQDwX/Gzg2oTIDaebKxY
	g0Zeg5GenvgOFmw1HV4l2fQI+abPz9jDMCyKvUKWsOxb9DQLAGsfbsoKzcuMuywBm3aH9ZO9XOL
	5fYtCWZ/XL1D+QytUTHcwW2UMkY8/uUo83GssagV31AiOhwadxJ7ZZXVu7bUy+98ZxRyE2w/Tup
	DWtlpJCvh7nitwp4RdlqU0MGHbkcEtfsC0RZiq9DYCW8t3VL8AgGtXJ197QdnldxBjd3DVoQ==
X-Received: by 2002:a17:906:6042:b0:c3f:98d4:dfda with SMTP id
 a640c23a62f3a-c513a5f04b2mr765814666b.3.1795389669778; Sun, 22 Nov 2026
 15:21:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Johan ter Mors <johan.termors@gmail.com>
Date: Mon, 23 Nov 2026 00:20:58 +0100
X-Gm-Features: Aa3M54q9i-eUfb68ANYI-0WXkcVo8MmJAw0JheY6aeJJhPoOK0SSWItMbYvqNQg
Message-ID: <CAPM+r-LfRteAFEuWu9am=K_S3cqP9iJFxiSnZK337_qwuC3HmA@mail.gmail.com>
Subject: =?UTF-8?Q?mptcp=3A_ADD=5FADDR_echoed_but_never_joined_after_the_fi?=
	=?UTF-8?Q?rst_announce_round_in_a_single=2Dnamespace_setup_on_6=2E12_=E2=80=94_c?=
	=?UTF-8?Q?ounters=2C_timing_sweep=2C_CVE=2Dcorpus_reconciliation_and_a_pm=2Ec_?=
	=?UTF-8?Q?pointer?=
To: mptcp@lists.linux.dev
Cc: netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi MPTCP team,

While investigating late-announce subflow behaviour with kernel-PM
netlink configuration on UML, we hit one behaviour difference we
cannot explain from the code, plus a few things we confirmed healthy.
Everything below is measured twice: packet-level (AF_PACKET sniffer
counting MPTCP subtypes) and via the MPTcpExt counters in
/proc/net/netstat, on self-built kernels of v6.12 and v7.3.5 (same
probe, same config).

The question: on 6.12, in a single-namespace setup, every ADD_ADDR
round after the first is echoed but never followed by a join =E2=80=94 not
even a socket-creation attempt. On 7.3.5 every round joins.

Sequence (single namespace, kernel PM, limits 4, endpoint id=3D8
127.0.0.3 SIGNAL, listener bound to 0.0.0.0:50560, 30 live loopback
MPTCP connections per round; each later round does pm_flush() + re-ADD
id=3D8 and creates 30 fresh connections before announcing):

Round 1 (first announce after boot), both 6.12 and 7.3.5:

MPJoinSynRx=3D30 MPJoinSynAckRx=3D30 MPJoinAckRx=3D30 -> all 30 conns join
AddAddr=3D46 EchoAdd=3D46
Rounds 2-5 with 1 s, 3 s, 10 s and 30 s wait between rounds, 6.12:

EchoAdd: 46 -> 152 -> 317 -> 543 -> 709 (echo tracks AddAddr:
the announce IS received
and echoed every round)
MPJoinSynTx / MPJoinSynRx / MPJoinAckRx: frozen at 30
MPJoinSynTxCreatSkErr: frozen at 16 (mptcp_subflow_create_socket
is never even called)
same after 30 s of idle: not a timeout, a stuck state.
Same rounds on 7.3.5: MPJoinAckRx 30 -> 60 -> 90 -> 120 -> 150 (every
round joins, CreatSkErr grows with the round =E2=80=94 the same dual-attemp=
t
pattern as round 1).

Two further data points that narrow it down:

A round-1 announce with ZERO live connections (endpoint registered, no
msk exists yet) also poisons 6.12: after creating connections and
announcing again, the same echo-yes/join-no signature appears. On
7.3.5 everything works. So "the first announce that was actually
received" is not the boundary; the state gets stuck regardless.
pm_flush() + re-ADD between rounds does NOT reset it on 6.12. (Also a
small aside: re-ADD of the same id without an intervening DEL/flush
returns -EBUSY on both releases =E2=80=94 we used flush+re-ADD for every
round.)
The counter signature (echo present, join work never scheduled, no
CreatSkErr/BindErr/ConnectErr) points at the echo-only branch in
mptcp_pm_add_addr_received() (pm.c): for addr->id > 0 with
!READ_ONCE(pm->accept_addr) the code just echoes and acks without
scheduling MPTCP_PM_ADD_ADDR_RECEIVED. But a freshly created msk
starts with accept_addr=3Dtrue and zero counters, and accept_addr is
only cleared in mptcp_pm_nl_add_addr_received() after sf_created when
a limit is hit (pm_netlink.c) =E2=80=94 so from the source we cannot see wh=
ich
state, in this topology only, pins 6.12 on the echo-only path from
round 2 onward while 7.3.5 does not. The two-namespace topology
(server announces to a client netns) does NOT show it on 6.12 either:
a re-ADD after DEL there re-establishes all subflows within ~90 ms.
The trigger seems to be the single-namespace "self-announce"
configuration, where both PM roles live in one netns =E2=80=94 e.g. local
proxy-style setups.

Follow-up on the state we report: we tried to reconcile it with the
2026 CVE corpus before bothering you further. We backported the
semantics of CVE-2026-46137/46158/46170 (ADD_ADDR-rtx timer
locking/refcounts), CVE-2026-97566 (ID0 anno_list cleanup) and
CVE-2026-99603 (SOCK_RCU_FREE on kernel-PM listeners) into our 6.12
test kernel and re-ran the probe sequence: round 1 still completes
joins, round 2 is still echo-only =E2=80=94 unchanged. The signature is als=
o
identical on IPv6 (announcing an fd00:: endpoint) and with
tcp_syncookies=3D2 forcing every MP_JOIN through the syncookie restore
path. A fresh listener (close + rebind between rounds) does not clear
it either. The one discriminator we found: with a short (~1 s)
announce-to-close dwell the echo->join path fires on every round (even
while the genl announce itself returns -EBUSY), while with a ~15 s
dwell it freezes permanently from round 2 onwards. So the
echo->accept->join-work path appears to latch a per-namespace "already
handled" state that only decays with time, independent of all the PM
fixes we could backport. Does that ring a bell? We're happy to run
anything specific.

Background on why we're careful with claims here: the same
request-socket lifecycle area produced CVE-2026-98432 (IPv4 handshake
IP-options UAF, fixed in 6.12.113 et al.), where Anthropic reported a
working remote-root exploit against an MPTCP listener and AWS
confirmed it =E2=80=94 while CloudLinux could not reproduce that claim. Our
own finding sits next to CVE-2026-99288 ("NoisyTCP", unhashed-socket
established lookup ABA, fixed in 6.12.117/6.18.63/7.3.4): Kim's own
FAQ answers the RCE question with "Not yet. and basically, no.", no
exploit is public, and no exploitation has been reported =E2=80=94 so we cl=
aim
nothing beyond what we measured. What we did add: a differential
stress harness that drives the UP-reachable preconditions (SYN/child
churn on fixed 4-tuples with abortive closes, 40 established
same-dport-chain connections doing lookup pressure, backlog-2
listeners, 25 s storm, ~45k churn events) on KASAN kernels on both
sides of the 99288 fix (6.12.0 vs 7.3.5): zero splats on either,
matching KernelCare's single-RX-queue analysis =E2=80=94 our UML lab is UP,=
 so
the two-CPU race cannot fire there. We note two lab facts that may
matter to testers: our UML builds lack CONFIG_SYN_COOKIES (the sysctl
is absent), so the cookie-socket path of the published PoC could not
be exercised from UML without a rebuild, and /proc/net MIB access is
the reliable observation channel.

Since then we closed two more legs of the 99288 investigation, and
both seem useful context for triage. (1) What we tried, reported
honestly as bounded negatives: we rebuilt on a 2-vCPU x86 qemu guest
with CONFIG_SYN_COOKIES and built a raw-packet harness (IP_HDRINCL
segments + AF_PACKET cookie sniffer, storm workers pinned per vCPU so
cookie churn runs on one CPU while lookup pressure runs on the other).
Trial t1: 14,068 SYN, 5,330 cookie SYN-ACKs, 42,640 crafted
cookie-ACKs, 294,160 established lookups; trial t2: 44,032 crafted
cookie-ACKs, 600,760 lookups. MIB deltas confirm the cookie path was
genuinely active (SyncookiesSent +29.9k, SyncookiesRecv +2.2k across
both trials), yet both trials ended clean =E2=80=94 no splat, no deref. One
open measurement question stays registered, not hand-waved: the
majority of the crafted ACKs fail cookie validation (SyncookiesFailed
+86.6k), and we have not yet isolated whether the child-present path
or the time-bucket behaviour dominates that. Our loopback guest has a
single receive queue, so the published PoC's fragment-spread technique
cannot be exercised here =E2=80=94 consistent with KernelCare's
single-RX-queue analysis. (2) The consequence, demonstrated as a
labeled simulation: on an otherwise healthy guest (10 TCP connections,
30/30 ping-pong roundtrips) we injected the equivalent NULL-deref via
the in-kernel crash-injection path (LKDTM, crashtype EXCEPTION, write
to address 0 =E2=80=94 the same failure mode as the 0x12 deref in tcp_v4_rc=
v):
"BUG: kernel NULL pointer dereference", "Oops: 0002 [#1] SMP", "Kernel
panic - not syncing", host gone, all connections dead, no recovery
without reboot. That is the A:H reading of the official CVSS 3.1 7.5
(AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) demonstrated behaviourally =E2=80=94 =
it
is explicitly not the race itself firing.

Scope notes from the same session, in case they help downstream
triage: Android GKI lines 5.15/6.1/6.6 carry no fix (fixed kernels are
6.12.117/6.18.63/7.3.4), so the crash class applies there at kernel
level; the GKI 6.12 line is fixed upstream, with merge level per
Google release. On the BSD side the specific ABA mechanism is
Linux-only (BSD/XNU manage request-socket lifetime differently), but
our adjacent FreeBSD work found a related availability weakness in the
same class: FreeBSD 14 deliberately shares one global budget between
challenge-ACKs and closed-port RSTs (tcp_subr.c
tcp_challenge_ack_check -> badport_bandlim(BANDLIM_TCP_RST), per the
in-source comment), which we measured live as a 44% drop in RST
delivery under challenge load (knee ~130 pps, hard plateau 121-132
rps, reconfirmed on a fresh 14.4 CI-VM; FreeBSD 12/13 and XNU,
per-connection 10/s, unaffected). We are preparing that as a separate
FreeBSD-side report.

Confirmed healthy in the same MPTCP scenarios (counter-verified, both
releases): joins complete normally after a late announce once the
listener serves the announced address (MPJoinAckRx=3D30/30, round 1);
establishment-time joins (endpoint present before connect,
SIGNAL|SUBFLOW) are 30/30 in the same namespace on 6.12 even after the
block appears, so the join machinery itself is healthy; REMOVE_ADDR
under 50 live subflows tears down gracefully with FIN (no RST) within
~90 ms and re-ADD re-establishes within ~90 ms; endpoint churn under
open joins returns EINVAL (not EBUSY) for in-use ids and works for
inactive ones; 100 announce/join/DELETE churn cycles show zero drift
with TIME_WAIT plateauing (~800) rather than accumulating;
KASAN-instrumented runs of the same scenarios report nothing.

We may well be misreading something in our own setup =E2=80=94 the probe is
small and self-contained (static C, netlink + AF_PACKET + getsockopt
only), and we are happy to send it or re-run anything specific,
including against net-next. If it helps, the decisive counters are
EchoAdd vs MPJoinSynTx/MPJoinSynTxCreatSkErr in MPTcpExt
(/proc/net/netstat); a printk or ftrace on the pm.c echo-only branch
under this sequence should settle it quickly.

Defensive-scope note: this is a defensive-security evaluation of the
TCP stack in an authorized lab; all traffic is between our own
namespaces and guests on loopback. No exploit is claimed or provided;
a longer evidence report (per-claim artifact hashes and manifests) is
available on request.

Thanks for your time.

Kind regards,
Johan ter Mors
Security Engineer
