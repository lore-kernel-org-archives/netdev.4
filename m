Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205655;
	b=UXz3ZT5GLlh3bxBpVXoXGwaZ9fIzCPkrOrn22rKA56nw+Bmq0idq/C4am2IKUvB4rAXa
	 h34TeXRbuYLphJq3FfbpTYMMrz4XP+9E6DC5wBxv2vjC3Zx1d1BaumxHL6YtrOyafGOHC
	 u2k4ewyZw7rYOM/diBdrmbvPrfHiYWdUc6LrxrLg8OdKsqm2dHzx8a4jTSlx3FpiXDUjL
	 zVDfF8SmCf3McdgOoqVX/ujG1lrHiXVYZhABnUHVwh3fX3n7kHJnqJc6w3Hkh3tVYfmWZ
	 f94MI3r3xGloXunmXwuD3c/eYFweUosdVdg51RBrUb7GYKndOICJQlPrqI41oNyxaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=JjHX1xnnKH1wRFB2B7NF/HoEUSrrAMKmnpCxj39LL/E=;
	b=Yqr1fVDnq6/8sR6I0sVse6b7M+JFq2pitVqhQAQhXJVpQ50KSQpnwRLLRpzKdwptic44
	 OGyLqa5ZfJzXxNfm7Sx6BNNZ1Cl82pXXl5rBklSpK7gXEVuzQph8fQVOZh51/MUWsK4nl
	 TCIXLlodD0m642Alj5GpnN0/essMUPoy562158fHz8vsZ+b2vRUP4rLdQUXKsUa6f4tyV
	 cFeoiluR3nh77PYUg6Emfd/h4P7gM+lbQ5Bkqq6CU8Cn6suRO7VeP/lX9tPb0U60hnZCe
	 5AaXKEmulow1kPtM8T4IjG1aPXiEidfvUF2LrMofdYvI3px/vbp9smqbF+gVDVutWWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kmpcU6bV;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5A606A335
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD5A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kmpcU6bV
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1640620eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205650; x=1795810450; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjHX1xnnKH1wRFB2B7NF/HoEUSrrAMKmnpCxj39LL/E=;
        b=kmpcU6bVFLMolMqArDBnCES5Pc3P8zrqd7vekqlFTJ0tG7jmNZVlIAU7IEksNm6zr4
         7L9Fmyw/BpP6J8/EPkrRWBlzfl0Aki6Ip3dUMxWDwxycWcLQE/Dl68DQOoFgET4Xka3W
         1dh6+jV4/SkhxLHVcR5eX8jgE/Dg/7LLCLsEvDiqCJWzh+VThqxicf/qm2QaovXCIgId
         5JdjngIrL/1UioK0JrNsgHFxrad6ABLsSK5K6rwv2UXam461Nxn8EdXOb8N/gSP34s8o
         WhowZM+f04P2FOW+JDkpGqPzt2L6WXLaosyMz1i9oQ/Z/TfBVNx/Q1NSwJOr9lNIPvvs
         59eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205650; x=1795810450;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjHX1xnnKH1wRFB2B7NF/HoEUSrrAMKmnpCxj39LL/E=;
        b=b/98rm48QufRNqkE0s9vXhwAMsOyGuMTIkfmzelILctUFwJmxIM3icrzt6HQ08qIfG
         6thX8Lm1DBOTi4EHSUSI3kKJPD79GsdQdUpMCanT0ddXEPFhSms8Zry7Qs5/WFSGOCgN
         NxfqCdy0L7ngpaBRo40nwLSbW5ItY9DUlfOEunT4TJwT1iZssG+9qdk6t71ukmkyKt+R
         6sDgmke1fwU310cQKQ/dVwYOgOcuQQZtZKMq/3QfeiYLcj8VFQqaHzJRSWV9fRxNnepj
         eMrvUATV2meJwomBw9I3CWcBNGjXePxvMRI09SMHcFnAmtt2LyV2SG5OMIJFHDzhSgsf
         FNIw==
X-Gm-Message-State: APuU4Z+74uvysH3kc2KDWFMgl4eag+UeLiCXWW5U0PXQ3P9zeCo0YJyd
	NL8JyB/pWlDo8Mwv5/FdQZJ12Bj0jv321LA1eEbvuzDvRtFayphA4aPUUuwLw8q1YlMmcNpFZlY
	FXhbVbRwE1m3fJauLnp/SkzeAgHwVTWKyBF8h3gTJIxfVUU4pa0RxvNPam4UrxMABRWM+9CC0/4
	sZfgq56s+3qpBi768MmzHr81zO7xv23/oYaP/dBufCbseNRxlhTt+B5a3EJSAOfFs=
X-Received: from dybzy23.prod.google.com ([2002:a05:7301:e117:b0:386:d33:70ea])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr4827891eec.17.1795205649452;
 Fri, 20 Nov 2026 12:14:09 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:01 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120201408.3445445-1-almasrymina@google.com>
Subject: [PATCH net-next v6 0/7] net: prevent mixing incompatible memory
 providers in skbs
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Josef Bacik <josef@toxicpanda.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

Enforce that all fragments in a nonlinear skb come from compatible
memory providers (and for devmem, the exact same binding).

Patch 1 fixes skb->unreadable propagation in skb_split() and skb_shift().
Patch 2 adds net_devmem_skb_binding() to prevent mixing different devmem
bindings in TX skbs (tcp_sendmsg_locked() and
zerocopy_fill_skb_from_devmem()) and rejects non-devmem unreadable
net_iovs (such as forwarded io_uring zcrx RX skbs) in
validate_xmit_unreadable_skb().
Patch 3 fixes skb->unreadable propagation and netmem comparison in
tcp_clone_payload().
Patch 4 propagates the skb_zcopy() uarg in tcp_mtu_probe() /
tcp_clone_payload() and rejects coalescing across different uargs.
Patch 5 updates existing KUnit tests so target skbs carry a realistic
compatible net_iov fragment before shifting or coalescing.
Patch 6 adds skb_mem_provider_compat() to prevent mixing incompatible
memory providers or devmem bindings across skb_try_coalesce(),
skb_gro_receive(), skb_gro_receive_list(), skb_segment(),
tcp_skb_can_collapse(), and skb_shift().
Patch 7 adds KUnit coverage verifying rejection of cross-binding and
cross-provider coalescing.

Fast-path and cacheline analysis:
skb->unreadable is a 1-bit flag inside struct_group(headers, ...)
alongside ip_summed, remcsum_offload, encapsulation, decrypted,
slow_gro, csum, and hash. Depending on Kconfig (e.g. CONFIG_NF_CONNTRACK
and CONFIG_SKB_EXTENSIONS), struct_group(headers, ...) starts in
cacheline 1 or cacheline 2 of struct sk_buff, and in all configs those
header fields are already loaded on both skbs in GRO and TCP
coalescing/collapse/sendmsg paths. skb_mem_provider_compat() checks only
likely(skb_frags_readable(skb1) && skb_frags_readable(skb2)) inline and
moves all skb_shinfo/frags[0]/net_iov inspection out-of-line into
__skb_mem_provider_compat(), so readable-only traffic loads zero extra
cachelines and avoids icache bloat:

- skb_try_coalesce() and tcp_skb_can_collapse(): already check
  skb_frags_readable() on both skbs (0 extra cachelines; unreadable
  provider check stays out-of-line).
- tcp_skb_can_collapse_rx(): untouched (all callers already guard
  readability or immediately call skb_try_coalesce()).
- skb_shift(): uses DEBUG_NET_WARN_ON_ONCE() alongside the existing
  pp_recycle and decrypted checks (0 instructions when
  CONFIG_DEBUG_NET=n; all callers already check tcp_skb_can_collapse()).
- tcp_sendmsg_locked(): checks unlikely(binding) before calling
  net_devmem_skb_binding(), keeping normal TX (binding == NULL)
  straight-line with 0 extra taken branches and 0 extra cachelines.
- skb_gro_receive() and skb_gro_receive_list(): adds two bit tests on
  skb->unreadable in the already-loaded headers group cacheline
  (0 extra cachelines).

v5 -> v6:
- Rebase onto net-next/main after the net -> net-next merge, resolving
  the net/core/net_test.c conflict (Jakub Kicinski).
- Split devmem TX binding & validate_xmit_unreadable_skb() fixes
  (patch 2), tcp_clone_payload() unreadable net_iov fix (patch 3), and
  KUnit test changes (patches 5 and 7) into separate patches
  (Jakub Kicinski).
- Keep shinfo and niov locals in validate_xmit_unreadable_skb() to keep
  the diff minimal (Stanislav Fomichev).
- Minimize fast-path impact: move unreadable provider comparison
  out-of-line into __skb_mem_provider_compat(), drop redundant
  tcp_skb_can_collapse_rx() check and skb_frags_can_coalesce() wrapper,
  use DEBUG_NET_WARN_ON_ONCE() in skb_shift(), and keep
  tcp_sendmsg_locked() non-devmem path branch-minimal (Jakub Kicinski).
- Also reject mixing incompatible frag_list providers in skb_segment().
- Drop the head_frag-on-unreadable rejection hunks from
  skb_try_coalesce() and skb_gro_receive() to address in a separate
  follow-up series.
- Add fast-path and cacheline analysis above.
- Collect Acked-by: Stanislav Fomichev <sdf@fomichev.me> on unchanged
  patches 1 and 4.
- v5: https://lore.kernel.org/netdev/20261115004003.3695475-1-almasrymina@google.com/

v4 -> v5:
- Drop skb_has_net_iovs() and check skb_frags_readable() and
  skb_shinfo(skb)->nr_frags directly in skb_net_iov_provider() and
  net_devmem_skb_binding().
- Add patch 3 to propagate the skb_zcopy() uarg in tcp_mtu_probe() /
  tcp_clone_payload().
- v4: https://lore.kernel.org/netdev/20261108013838.1454450-1-almasrymina@google.com/

v3 -> v4:
- Fold skb_shinfo(skb)->nr_frags into skb_has_net_iovs() and drop
  redundant nr_frags checks in skb_net_iov_provider() and
  net_devmem_skb_binding() (Stanislav Fomichev).
- Remove the empty-skb check and redundant !skb_has_net_iovs(skb1)
  branch from skb_mem_provider_compat(), and add a comment on the
  early skb_has_net_iovs() check (Stanislav Fomichev).
- Propagate skb->unreadable and compare skb_frag_netmem() directly in
  tcp_clone_payload() instead of rejecting unreadable skbs in
  tcp_can_coalesce_send_queue_head().
- v3: https://lore.kernel.org/netdev/20261104042521.3979880-1-almasrymina@google.com/

v2 -> v3:
- Drop patch 2 ("netmem: store memory provider private pointer directly
  in struct net_iov") and compare net_iov_owner(niov) (for devmem) /
  niov->desc.pp (for other net_iov providers) directly in
  skb_mem_provider_compat() (Stanislav Fomichev).
- Squash the skb_frags_can_coalesce() helper patch into its caller patch
  (Stanislav Fomichev).
- v2: https://lore.kernel.org/netdev/20261102231827.4088254-1-almasrymina@google.com/

v1 -> v2:
- Generalize the check across TX, TCP collapse, GRO, IP defrag,
  skb_shift(), and skb_try_coalesce() by storing mp_priv directly in
  struct net_iov and introducing skb_frags_can_coalesce().
- Fix skb->unreadable propagation in skb_split() and skb_shift().
- Add KUnit coverage for cross-provider and cross-binding rejection.
- v1: https://lore.kernel.org/netdev/20261008034027.1403188-1-almasrymina@google.com/

Mina Almasry (7):
  net: fix skb->unreadable propagation in skb_split() and skb_shift()
  net: devmem: prevent mixing TX bindings and reject non-devmem xmit
  tcp: fix unreadable net_iov handling in tcp_clone_payload()
  tcp: propagate skb_zcopy() uarg in tcp_mtu_probe()
  net: kunit: attach net_iov frags to target skbs in unreadable tests
  net: prevent mixing frags from different memory providers or bindings
  net: kunit: test incompatible memory provider rejection

 include/linux/skbuff.h | 18 +++++++++++++
 include/net/tcp.h      |  2 +-
 net/core/datagram.c    |  4 +--
 net/core/dev.c         |  8 +++---
 net/core/devmem.h      | 22 +++++++++++++++
 net/core/gro.c         |  6 +++++
 net/core/net_test.c    | 61 +++++++++++++++++++++++++++++++++++++-----
 net/core/skbuff.c      | 57 +++++++++++++++++++++++++++++++++++++--
 net/ipv4/tcp.c         |  4 ++-
 net/ipv4/tcp_output.c  |  9 +++++--
 10 files changed, 173 insertions(+), 18 deletions(-)


base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.56.1.750.gf70dc682cf-goog

