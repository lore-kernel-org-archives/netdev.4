Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533181;
	b=f03j4fgmpPV1YpothcLUI+tzIGY9qcF9CAznOebeZ754+1EJuk6t5gr8aF9dTum/PTiX
	 QJBtPCmn5uf3eA4Lh6Z3nIlVlnpzqayXmZKfwG3+Lb5Bb7axTfNVUOTasAkcxsDyvch6j
	 LzTQp0hMM13+7Q0o8ETTs0Cipz/IFPNIoSimTpYyE30zf/VYvabkFMfJzGIU9PjSmr1r6
	 CseHlTA7u4m0a3icvpPA7tcXv9rQXw7nzCf/dIm3+9W7ynbA1a4KIhRfishfmKO3kGL/8
	 HNfM9o85UOFypbX1vI1pWMYB/BV+K56fJhiFudQtCoiCWT50gmsEDsTKCcvFJF+ajeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rwg2yD1zJeOjWk9k6blison6UKKrmu+SCF2d3nY+2Pc=;
	b=G6PLaAIwBECpI65rx6e91qIVmpfU0q4HdtSnjpajDjS6QL+gciFaeEmmaZcdCnRFmgvd
	 Y5+T9PE8tx0E57cbyB3YHvmpXEyM+3nZ6KDsoqUeXxfQYG6gz1qKfQv5H0JrsJfiE+Vgm
	 d6GrYA+eoHWqmkxVo7mDMt0UC4XNk1ahixbfHmB3+n2aNVstv/zMu226n7Eua7ZrvrdOy
	 CcadgSu7JehQorBfy4F1AsWvEtvCDPRedbKRoGVjszqjyk88wHE2CPgNK6HTlGA9Wbe/M
	 /ued8X02CZUGQu5Z6TfTBB7N8BXFMFbcSfSpA+vUF6bMDR0SLti6T7yzECKd5GUL23g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=aqSip14k;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EDB606A339
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88EDB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=aqSip14k
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so40883625e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795533179; x=1796137979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwg2yD1zJeOjWk9k6blison6UKKrmu+SCF2d3nY+2Pc=;
        b=aqSip14kJuwOstw9v1SSzcUqfxbfcSSU1+YaNCeXU7kbwhBBGtPWSlwIMRuIbzfuaL
         ERWULgL2sqSxy9m2yB+GHEnsgz3v7oetNbCl6qWvpij49i+MgesFHx2us+4u8WbGCzbC
         8MdAf1/yl+uFdGCt0rDcvBAJNnYIvfPq9/QUn56gdyJ1Tv+TJzVS41ZJrW03dFgMhQpH
         qwRObwBamonPdZl0dllqDtMgJjVNKthhu+GfWx0ANFoD8+gvJBtNaCRR2hq9nPvwV2OC
         J3pcAgmbg+0PA27wvo6+P2r8s7NL5AD8NHYpc0Rp6ak9nmEFCWtPJnJppLAf3dTMnWd/
         rOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533179; x=1796137979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwg2yD1zJeOjWk9k6blison6UKKrmu+SCF2d3nY+2Pc=;
        b=ayijIF+lwnb5gvUXlw+52HShOh5AobGIRO6GP29nvtjcJ084F7hg9dggBmk3QmC2Mt
         aBHcKGL8wnWLFKc/ktl1rzB4HxO/We6msaKVeYzdN3S0YR3rqc+DML4T27GZL4qvVaff
         M/LZiKXNfuKqkUdxHn5ep+4/UoCYdeyzOuFXC3CRXJMy0bKrCatWjB096tEjaHqAQodv
         +VfX4SL8l9+75e+51RR3x0X9R4DZaHptWdGSitGoi8+K9HearytA95E/Na6Y443659F5
         yBvS2kiVMoVm9gD4I5jgcRYezseuqwzv/uznWM06XcRiY1xguWJGOLRPFLQrfH2+09PQ
         UX6Q==
X-Forwarded-Encrypted: i=1; AL+hErEVvFY6TtQZ1kpr1zTXw7MlVQHcaUms0IGA3gB/83BKckwLN+GqB2TnewqbTcJZ3UP25jIisY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EUZajGcd31MJWaKrvbyT/cASXLD2T/kxSo2WOZOS5WojM1s10
	B0jtcBE/yCY6RGBcsJt5r3dnYyHF0+IoJXS2M0LlAe+2AYWOmRxwNnerz3fb6EwNIHE=
X-Gm-Gg: AZFdTZfyvrRSPJDsGWVVpWqyJOIdot6HB2bixCOVIlDgXGEdMit1ev5rlzthG9C/21u
	nI7DanaKKMTDSDtvVD5olPaAzHaW4SVVft7SAAK3dndDeIXPIJtKe/HOtI6E+pYLOyOhqhm66ho
	5O9M/0a2JIaK9zpjU3EnNBapxxqegVaXq9oASiQeh9m4U3xSdrShRFq7bcp+Q62zUBaCAskJlPa
	QmstcjFMJaz61nQqqo3J7az7EcYEBURr1ZiEIzZbm7Rjp1tMFNBlTnW+46nT0MsD2EBxqNpD2XO
	GwinTFZ8A/A/HfzXAyitncHU/M6UByNPacW25leGqLO0lpRF4/J9CQmQXAgz3acSuJ1h4Z5oPAf
	CsKiSNwpWr8EX7FVW3V8A9KBwePKN/34tKSiVWKQ5gphKlsHy3ZC3a8SE1bPf/DdJbWi607FvAQ
	wLe1v/T4lPQsA0+XMzEq/rNrMCCoD6dndUORwpj+OeHmNKgAMFuLOl24ZdaH7zigKkzZ2G8929y
	m3NuJ0wLY6XDIPLzx6Ev9De29kc5ZH0sChS3tb5RBBrrmGqgOgVXHuAXZrlQ9v6Bd9Cyj2k5F0Z
	uRYORoQC6lDE+81ZL9dZbNaBqLYVgxAafWLuvurTOtb3fwhZjJw=
X-Received: by 2002:a05:600c:a086:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb88817ef1mr320282735e9.24.1795533178500;
        Tue, 24 Nov 2026 07:12:58 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6bc8ce06sm27944396f8f.47.2026.11.24.07.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:12:58 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [PATCH RFC bpf-next 0/4] bpf: add bpf_sk_assign support on netkit egress
Date: Tue, 24 Nov 2026 17:12:40 +0200
Message-ID: <20261124151244.1423343-1-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
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

Hi,
This RFC narrows the earlier egress series [1] to netkit's transmit
path. NETKIT_PASS queues the assigned skb directly to the peer's
receive backlog. NETKIT_REDIRECT clears the assignment before forwarding.

General TC egress support would require changes across the networking
stack. Many transmit paths rely on skb->sk and skb->destructor for
send-side ownership and socket write-memory accounting, and would need
to handle an assigned socket reference in place of the transmit owner.

There is a new sk_assign_skb added to bpf_net_context that is used to
record the exact skb netkit is running BPF on, bpf_sk_assign uses that
identity to allow egress assignment for that skb. It is valid only when
the new kern_flags bit is set, that is used to avoid always initializing
it to NULL in bpf_net_ctx_set.
A nested tc egress program running on a clone still gets -EOPNOTSUPP.

This series builds on Daniel's work [2] to steer netkit traffic to a
transparent proxy in the receiving namespace. The receive backlog can
outlive the transmit path's RCU read-side section, so the skb takes its
own socket reference even for SOCK_RCU_FREE listeners.

The selftests exercise the new netkit sk assign for both IPv4/IPv6 and
TCP/UDP.

Feedback is most welcome, more importantly if the approach taken in
patch 03 is acceptable.

Changes since the original posting:
 - Use a new approach to limit the egress sk assign only to netkit
 - Reduce the number of selftests
 - Drop some unnecessary fixes of pre-existing problems

Pre-existing problems found during reviews that will be dealt with
separately:
   - Receive lookup could use a prefetched socket whose protocol, family
     or network namespace did not match the packet
   - GRO via gro_cells can merge an assigned skb after tunnel
     decapsulation and discard its socket reference without calling the
     destructor
   - When a reuseport program rejects an assigned UDP socket, receive can
     report an error pointer as rx_sk to the kfree_skb tracepoint
   - A generic XDP program, an rx_handler or a classic mirred action on
     the receiving device can forward the assigned skb to another network
     namespace. Generic XDP can also drop the assignment when it copies
     the skb, so the packet falls back to normal socket lookup
   - nsim_forward_skb() queues the skb for napi_gro_receive() without
     orphaning it. GRO can discard its socket reference when merging it

Thanks,
 Nik

[1] https://lore.kernel.org/bpf/20261119142231.2612515-1-razor@blackwall.org/
[2] https://github.com/cilium/linux/commits/pr/bpf-tproxy


Nikolay Aleksandrov (4):
  net: track references owned by prefetched socket assignments
  bpf: preserve owned socket assignments on ingress redirects
  bpf: support bpf_sk_assign in netkit tx path
  selftests/bpf: test netkit socket assignment to a transparent proxy

 drivers/net/netkit.c                          |  10 +
 include/linux/filter.h                        |   4 +
 include/net/inet6_hashtables.h                |  10 +-
 include/net/inet_hashtables.h                 |  10 +-
 include/net/netkit.h                          |  15 ++
 include/net/request_sock.h                    |  10 +-
 include/net/sock.h                            |   4 +-
 include/uapi/linux/bpf.h                      |   9 +-
 net/core/filter.c                             |  50 ++++-
 net/core/sock.c                               |   7 +
 net/netfilter/nf_queue.c                      |  16 +-
 tools/include/uapi/linux/bpf.h                |   9 +-
 .../bpf/prog_tests/sk_assign_netkit.c         | 189 ++++++++++++++++++
 .../selftests/bpf/progs/sk_assign_netkit.c    |  95 +++++++++
 14 files changed, 412 insertions(+), 26 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/sk_assign_netkit.c
 create mode 100644 tools/testing/selftests/bpf/progs/sk_assign_netkit.c

-- 
2.47.3

