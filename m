Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036184;
	b=p7kRnNs4s17RLiA0TFlT5wi3UbHI81qJve68p+/w2hvDuh48h7k8qEuIzHdi2KWt2Dyq
	 LUKlq3vGYBN5hTxvGPAr8SMkCXRJNgxrcLic68b3lSIzMW6+YRSROfoA+QSiJMZC66JtF
	 zEsmPk0qm3Y8/PlE+NfjlAV1/3eC5ly9B7qVFkzYrzyif1261A3JnzovBIUX2MErNcJIx
	 0At3bAZs5IhSXNS4ZFu5CHYf8dCbs4trQsa5oT7qRGz0rikFHwjt7Wawk5RMGjLBbcZHH
	 16yO3FDnUGjBxtd4UmVyCtPe3K+ljXQz+TaPwj1TU6y5D6u4pka+8RxABfbzvX4MQKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=F5zS8GR6/Kkx2ferGhUL7NRtyhbrsq6/kvurR9syByw=;
	b=v3q7RrxA//IC9jnxGO5ezJo9Lx0ghwfDkJuxL6xUcRGqK4OD520lAfp35XaslavNhvf+
	 56uyrAJzvdnhfBrEg/qXqeXdbNKPvxzttBpFz+75bpC1IKjoJA1I+TFOeN2NBUoIPYKo3
	 v663utVCZyBxcyBKg7vOWOzC4t9ftEWbG8Ibdr0vBLCGmoMxF+SHKl3zxN5W2qg92K6D8
	 BCSF2QA6HPRaOsjQIpRbSI4g2FFf+PJ4FlAoSKc8sZblNJ2OUpESzBzcF7LStEghi5X1e
	 bYlCreHp+sCY3ruiFwwDcHYgTctPY8jtWULNsGh6D8Sgmvgu/ZpzaxK4l/jijXY84XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DAn9aU10;
	arc=none smtp.remote-ip=209.85.222.69
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA14606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA14606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DAn9aU10
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e13604fb3so920120241.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795036183; x=1795640983; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5zS8GR6/Kkx2ferGhUL7NRtyhbrsq6/kvurR9syByw=;
        b=DAn9aU10rkgwdeQ2ZisWVg6X/p5hbKE0gZYi6m+pna8E12XUJwBRH/SYlXOimG8Fpz
         fMVm5rDhthp6CcPMevx9QhyOECcqdFcAnuA1EMy/9UTBPFxMbjG/QYmgcaldkq1EaaBY
         cJoza8Uu0nMBqlhA/cFbrMO0EHtz6GPgc19Vf6Vpzl+BecLtDCR58CKk23srDj8Y1moA
         y1/wAnt4qdSsfPHJvuSsIRkyfteu5W6DeIc3inOkr0YDs88R1fl+PkQiTZVIE5sqoe1u
         MeaH+S35T/Ipqd597gAddRG6BWI+/OHM3FiYKTPjxB3zXhY5zaQ2zPbc6iBEoCBKfOlq
         MNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036183; x=1795640983;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5zS8GR6/Kkx2ferGhUL7NRtyhbrsq6/kvurR9syByw=;
        b=L2fI3ruH0pfyzl2L53CVvpIyYVnJ87ki5x39DYq7o/zZ13Qe5AY0rNf8DhJ2C9sund
         CcByiqgCSyoDtEmO/o+TUN5dvCjU7mwTly2z2BpnqkqV5t2NoboKcIXINLV4nla04WkA
         FHSUOiR14BVZ+I1iPrSYfBql2UdYY3P1fY6sN2qvI22WV7gPHp3Of9fiVPmCd3dquz/d
         4oZ/E+wM+28dSVvvzvDFA39TdiAmA/fH+ezwsr7E2T5hws6HMqlgntxAa/S0rLQFIJlP
         eJsaIumI2ZYr+DZL3KZVh0oECgvHWOxU2gh1SJKqx2uW8dKx/3ub+bOcpyAQNCVcJou1
         Hduw==
X-Forwarded-Encrypted: i=1; AL+hErEB1VD8vkQjRXLRLSQRMFwFScDgenQhl0L1uAQ/wn1Rw9mL+LfDLUQqa86sSqfwHfBRQd7QRv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TtcKlM85iQdavknc3aZVU9lEfZKvjsdZgf+14vwxH81UctFDQ
	LSELsr8S0aK/ue09xqO3lnlIV4v++OeUGttKvcmU18Tu9cjdVlUhpin1qmTe7JkSVvVMMCL/EtY
	O/cU1o4R12TMI2f+CABRDacc/ag==
X-Received: from uabdh12.prod.google.com ([2002:a05:6130:250c:b0:98c:53e1:4af8])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:e08:b0:7c3:1395:a090 with SMTP id ada2fe7eead31-7d6ba3c58ebmr1924468137.6.1795036182615;
 Wed, 18 Nov 2026 13:09:42 -0800 (PST)
Date: Wed, 18 Nov 2026 21:09:31 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261118210933.2477423-1-thaisonphan@google.com>
Subject: [PATCH net v4 0/2] tcp: initialize missing request_sock fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Simon Horman <horms@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Initialize missing request_sock fields for TCP connections accepted via
SYN cookies, where cookie_tcp_reqsk_alloc() and
bpf_sk_assign_tcp_reqsk() allocate without __GFP_ZERO:

- Patch 1 initializes ireq->ir_rmt_addr and ireq->ir_loc_addr to
  LOOPBACK4_IPV6 in cookie_v6_check(), matching tcp_v6_init_req().
- Patch 2 initializes the AccECN request_sock fields in
  cookie_tcp_reqsk_init() and sets syn_ect_snt in cookie_{v4,v6}_check()
  for kernel-generated cookies (!req->syncookie), matching
  tcp_openreq_init() and tcp_{v4,v6}_send_synack().

An AI coding assistant helped audit the request_sock initialization
paths, write the QEMU reproducer, and draft the changelogs.

v4:
  - Patch 2: restore treq->syn_ect_snt = 0 in cookie_tcp_reqsk_init()
    and guard syn_ect_snt updates in cookie_{v4,v6}_check() with
    !req->syncookie for BPF custom syncookies; document in changelog
    (Sashiko, Eric Dumazet)
  - Patch 2: add Reviewed-by tag from Matthieu Baerts
v3: https://lore.kernel.org/netdev/20261117124710.1338951-1-thaisonphan@google.com/
  - Patch 2: clarify syn_ect_snt / tcp_accecn_third_ack() description
    for AccECN connections and reference RFC 9768 Table 4
    (Chia-Yu Chang)
v2: https://lore.kernel.org/netdev/20261116023709.132684-1-thaisonphan@google.com/
  - Patch 1: clarify how KASAN (via SLUB_RCU_DEBUG) exposed the bug,
    explain how it was observed, and include the inet_sock_set_state
    trace line (Eric Dumazet)
  - Patch 2: drop redundant treq->syn_ect_snt = 0 in
    cookie_tcp_reqsk_init() and clarify how the bug was found and
    observed via TCP_INFO (Eric Dumazet)
  - Add Eric Dumazet's Reviewed-by tags
v1: https://lore.kernel.org/netdev/20261114161248.3428695-1-thaisonphan@google.com/

Thaison Phan (2):
  tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
  tcp: accecn: initialize AccECN fields in syncookie path

 net/ipv4/syncookies.c | 7 +++++++
 net/ipv6/syncookies.c | 6 ++++++
 2 files changed, 13 insertions(+)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1.831.g720f3f5937-goog

