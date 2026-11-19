Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072614;
	b=N9v1exmUkIZ0mzDhmRoMjKXmbzA/8OvYGSaPUovRGS0z1ZyioPZHwQtX0uU4O3Cc0eaq
	 L3rE4IVyNaTmcS+hAvAkAo4nrCyu5v8pwtGpCadvRrwx220zvXi5OIoFTizilDtiXybIE
	 s7W5/c4ZnD1ePnlRbBvkI14Y6CHUl9PCRcPOxmV0G4MDAssQwCETkbax3CVmh3QbvRDZz
	 AK5zvORh1QRNpvlSuMItSZWOErCh5KwYjEWLyuoLgl8Og4n+MqhMOb+Vzn1OyseKzLCGA
	 l2iozFcUSzb0bLEdxL317mCt4keqAShCRW38AcwnMzTnXKsMV56oDQkzAQ9yRMAwsxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=36/82EqcliLLkBXq/Gk0sXygwhD+qbzxdyFBMAKOhkI=;
	b=zm5fAqyl1jmWG2PUoLOzSA5NWUdeq6Zv8KMSx5BiK3e7NJ1y9GOFnnbRqA1vJlSUuUyi
	 xmrVqNljAe4iPlzBMhturt1PQi2BRJKTd/YeaQR/UHiFT9iD5N/vlTvfON+8xvlbUohEV
	 k9i5xTsXm7CsYkA+RHmpqg7iHmXC4nqiqinKGZdjODI6Oocg0R2mwixhTiQp60TBbnU34
	 9Y/SZa5vDKs7EYGDgt6G9XRADjf9AfLSu2n+7GM7J4lo6OgG8IgIj5TEp39JHr0vXv0N/
	 8Q0u1bd067VfE1B3I8Dj39yFFn1xw+xkl38ohHxCV2vI9fO95wGm7OhdQteVJmD19kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZCgSU+TA;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7002606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7002606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZCgSU+TA
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cddf142187aso1152656a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795072613; x=1795677413; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36/82EqcliLLkBXq/Gk0sXygwhD+qbzxdyFBMAKOhkI=;
        b=ZCgSU+TA/u3wXW5OrEVFHaUL+uwq7zBMxGtXAk5mTRfEBl0eYt4wmnXY/6AxV85bBq
         fqfUfsrePINrDfp5DS4x2iZl/J1kLB+vs8x8xfNYPblP2LGXpgrs28AlupRT3UFXq2V2
         4ANJHEhsxvnLDUMweu+KWb5TF8CTTwj7j198RNVNeWKKDd+m/sMQ9flup+prYdnMKmha
         fMsFb+F+7tX4zA32SdQwQvuiu7RcFfJmpdva218E9+HE9m3rLxKwgEXyI9VMW7np8Lzw
         MoTbqczdvgxamm3KnuhVQZXYScwoJcmPfG5C9ahvo2DUf6DknmxsP+Fu39Qsd/surVO4
         j+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072613; x=1795677413;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36/82EqcliLLkBXq/Gk0sXygwhD+qbzxdyFBMAKOhkI=;
        b=rZKCFIfeL0FwkKRpN+OABaNBOEotELGuuKjI6xHYRrkBhjuTwPz0JnzAQ9Xb9kWs/E
         w9J4PQv0XSGHQN8D0NJW9T23slNDjfbwFLBE1kh9A65o3uopt84Rgsd68HTlMQgwhdrQ
         kDHIkgmAyiMAf8uxkh3fqRHkvWJdc6DpI2RkV2biL5QuXQRjgT1cd7IdV3Gcxs/MtXqd
         qtlL88nVhPr6tyaYB5gbvgSuF6WNfybOOZz0WfQV2ZHT1eKp0DoLBSCAoErRf9DxL5X+
         AM66Q9mbwAZNcvrGFpEL9CSWJ2DDJUeQRzk6wfu78ihc3GJCpeYFMYghDkWvEi+XNz1W
         bB3Q==
X-Forwarded-Encrypted: i=1; AL+hErHbGD+X8be3HZar0Vuq+9HtDwXQ2p2fskUwhmwQ2Q+u+uBRMpnvYwPSNGmAdpCzbkFWAjr/Lkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lXpvQ2MJFDczEcrbDEorFPwG7wMzykQwR5ZTHTHFsEUaBhSLH
	2MdiaDBR0EaFPlZhDiO3BbEShJuaLtHqKTG34ggaKpZWk4JCUC18Q3reVX3O04/DePq0UluZCXG
	NF5rAxg==
X-Received: from pjbds24.prod.google.com ([2002:a17:90b:8d8:b0:3b3:fff8:e92a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dcb:b0:3b3:af8e:ea98
 with SMTP id 98e67ed59e1d1-3b3d07d3d1cmr4485886a91.37.1795072612860; Wed, 18
 Nov 2026 23:16:52 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:52 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119071649.374106-1-kuniyu@google.com>
Subject: [PATCH v3 net-next 0/7] tcp: Prevent tcp_collapse() from bloating queue.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is a follow-up for commit 031c403d13e5 ("tcp: do not let
tcp_collapse() drive sk_forward_alloc negative").

The core algorithm in tcp_collapse() is so simple and has not
been changed since commit 1da177e4c3f4 ("Linux-2.6.12-rc2");
finding a collapsible skb and repacking it into up-to-SKB_MAX_ORDER()
skb.

Now that we use 4K MSS and tp->scaling_ratio, the simple algorithm
does not work well, and it could even end up consuming more memory
contrary to the intention.

For example, the scaling ratio of SKB_MAX_ORDER() is 222, but
typically tp->scaling_ratio for 4K MSS flow is 252, and repacking
data rather bloats high-density skb.

Also, once a low-density skb starts collapsing, it drags all the
following skbs into collapsing regardless of the density.

This series changes the algorithm so that it skips high-density
skb and a single low-density skb between high-density skbs, batches
memory accounting at the end, and removes sk_forced_mem_schedule().

This series still keeps linear SKB_MAX_ORDER(0, 0) skbs as the
collapse target, and Eric is working on a follow-up patch to
store the collapsed payload in order-0 page frags instead.

https://lore.kernel.org/netdev/CAL4WiiqekjxZw3EoDYXLc0Phd3i0GStE2ZHWQkH2iAkSM5D8TQ@mail.gmail.com/


Changes:
  v3:
    * Patch 3:
      * Remove fully-overlapping skb in the 2nd loop
      * Skip range on overlapping unmergeable ofo skb
      * Update tcp_collapse() comment
    * Patch 4:
      * Remove redundant kmalloc_size_roundup()
      * Rename helper with skb_ prefix
      * Declare {old,new}_truesize as unsigned int
    * Patch 5:
      * Make TCP_COLLAPSE_MAX_TOTAL_SIZE hard-limit for multiple skbs

  v2: https://lore.kernel.org/netdev/20261116230555.2305867-1-kuniyu@google.com/
    * Patch 1: Describe SYN/FIN behaviour change
    * Patch 3: Describe behavioural change for MPTCP
    * Patch 4: Add compute_skb_truesize() instead of macro
    * Patch 7: Rename test to tcp_rcv_collapse_bloated.pkt

  v1: https://lore.kernel.org/netdev/20261114040101.1043546-1-kuniyu@google.com/



Kuniyuki Iwashima (7):
  tcp: Refactor the first loop in tcp_collapse().
  tcp: Don't collapse high density skb.
  tcp: Stop collapsing if not bloated.
  tcp: Skip collapsing if collapsed skb is less-dense.
  tcp: Allocate all new skb before collapsing.
  tcp: Batch memory accounting in tcp_collapse().
  selftest: packetdrill: Add test for tcp_collapse().

 include/linux/skbuff.h                        |   2 +
 net/core/skbuff.c                             |  27 ++-
 net/ipv4/tcp_input.c                          | 190 +++++++++++++-----
 .../selftests/net/packetdrill/ksft_runner.sh  |   9 +
 .../packetdrill/tcp_rcv_collapse_bloated.pkt  | 135 +++++++++++++
 5 files changed, 311 insertions(+), 52 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_bloated.pkt

-- 
2.56.1.708.g77570a6a1d-goog

