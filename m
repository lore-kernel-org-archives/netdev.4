Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098505;
	b=eWQRCNstS8kEn4+snHLFNMw4n38TabJ6LcwFuntnATXqhqRGkHWy0iAuTGtvQzicRxUE
	 3/4KN9ha4CONlIgEfLLLYSr5Oc5ASspAdfrjBRxl1xCZh7N7PgeTwF6pzZwibj6crJGgT
	 Sv1dY59U2uPlxtktRcWrCcuFqtfU2C1L0oFALITNE5gnx5StettysoZw77ELtzjTLnV3c
	 SpajVh/JXZ7G0U+xNlqgCV2tcRCfEggnPc7BW91YGScjVDRALXMnu4x0nNwZfh8R48zud
	 vIsCTRoV9mWcQd/wELrAb9R4qOuow7E1LGaMVwvHXLtOU3gEHcDjsGYdq4P0WKeodPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MN15rtynJucizsmELauHmdt1P7lrQUtZFL6V1R2zVCE=;
	b=nVv/BeaWA6yIUM8E3bmiGSwh3rzHX/Y5GKU8yLz3ItvMRpBJLI89ByGvfiIFvLp2Kiow
	 L8mVVrQA7xlIjk/1PyHSoPcuIVvZqVpBddtMkOEJEosbUrD6YGzN6/FozHHY01cEyp0rz
	 CIhT77zreVMNEyiyOl6yOT/JZZvH+R2B7JTNnkoxZD3ufNcbDy5B9Uw4hnkQrgyjwfXy0
	 1FRiybaJB4wMpqdqn3gCe7Gjc8NGxwOyo+xBLFQ8O4Chi8aFI9ASzTfyGQb5crX+Ty/ez
	 LaNSw+WI5wnEnxgBoD3uZghPLFOq/YrGRL0WMRot0JfFqDVP1CPtPPDRzHRY6bczPHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b="HaTu+e//";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D003F606A337
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D003F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=HaTu+e//
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so27295035e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795098503; x=1795703303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MN15rtynJucizsmELauHmdt1P7lrQUtZFL6V1R2zVCE=;
        b=HaTu+e//x8trcNFE+8n3X+Rj5wqLN+MlpnqqCfC6tfIs4fL+CSzuvcvGAAH6MaFGxU
         7NF0RaBZGSklI4k9eQJHpB8j1rErNuqOft5KQoVAkg7+0M00LiLbboR+d00sCSaS2Py3
         34d1bzrYRDa5icaRMgZvD0mo28x2nsWvf0z8PFEq+LZsYdPI9d15cPt40uR/AkVpKvJ2
         FeCV7qy1r9l4WTcukQsacvJCs02UM+G5b6lWXX+9gvFfKC0PB8yVglqr47hYV1oEaiJ7
         9VU002/Df5fs9IrR3FmkLKDThgg8I2nkl6OZ2xZVHK1SjEpRkWmRe7bQEdsTQXlYVBdM
         1zEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098503; x=1795703303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MN15rtynJucizsmELauHmdt1P7lrQUtZFL6V1R2zVCE=;
        b=ZSYydVUAlop7sp9wX7r4PKTWJSWoof1Dx9o+HEleuNuJqomAyr3APLIkbDTLrf5Oe8
         XVq1EPpNzMeCOCzmuLT12MNhGVZm2m/rJId9vjdlO0H9HfpnCPRP/aJgI7ljimZXIT4g
         8n/kdVl3qxj3i1z38cOHzVG9698CugqwZ43A1ptm3tBtbt4dPD+0eMH71v1n2PEMtcVt
         zL3AukfeYWFozTjnoO0bNAbCmoFR5vxgV9gWU7aedZDGzMqa5inTwMwCHRiUF+uPjqHD
         8u8ppcNToiKR43MBm4qMB1qvb6enRABeGMLU5Q/BPLW/9oXFv5go1BgVqdCWow4dTSWv
         vudw==
X-Forwarded-Encrypted: i=1; AL+hErH5B2Tewm3h9vTZOJv+C/ot/8mc32JuFoHx4ZB8qUkRxu3INGlc02klcB/Zgwc+YCzE9Pq30x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/owZmzKOjfoboHx9Hrj2lWCEbn1TFmxs7qJcVd1WXwvodIskx+
	N+lQasF7zHTsaeOkYkJwb7b6ScSK5vKXnfW31F8e2lYG5870S1avXaqQgUprUQcPimM=
X-Gm-Gg: AYBFou1Jb2qy5X5dHCrGRgHSfI50skYpx3AuyJmGpoSlk+VlncwNbCwnKvBCS/oUKYe
	qVUyNdqrM+Y3+59UpILeqblb6Dtf9wOTfJWqsQOFANWDG8jMnNdCrd2LgUOtYCU/vaeoVSpJSFy
	Ef+eClwN7h7OwVuX7KTbauwX8h3ls0Qtyi+iQJp/k3YqAqLKF2Ge6Ym0iZ1xAepkd5UVX1ZAYGx
	Z3CM+tvUk9l7ZvWiY5t3nMx2t7g4HELyLS5+hTXENKkMMHuCDZcjso8WHZbi1snYFefoXE9wt5D
	WRds5yLofiYn6ZBNmYDAlRMXxURyXO185pPqLpWNPw2rhfYj5LZTWEjRn/uK85yEcL4rJbXVjG4
	58Vc1o4d+c5d5Ojh/Ov5NGwbK43cG4MGZZPqmLyXXrJYsn3whCU4XwvMFQVjBvejT71tZVfeS1G
	Amjw/oOrZ1p5uPLSNIjgZsA8l7dqqguF3i80J5mm0P7U/IhhrC0tA3Mbr9XQP5LtIZUMmDZMppD
	Jc2hapBStUETsntRXBljuGayM0qe7Olzh1MCqEzgDLOj8AWmckPHKJ0NLaEu5TI4xn61sk0qLVo
	h78w0RpSoWOZ81fQXTu4IaqEhrMHSR9EVTc4Mh5Wh3F92Cw9jpk=
X-Received: by 2002:a05:600c:3ac5:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb7da0f906mr124307595e9.9.1795098503293;
        Thu, 19 Nov 2026 06:28:23 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab4ff7073asm176516f8f.8.2026.11.19.06.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:28:22 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paul Chaignon <paul@isovalent.com>,
	Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 4/8] bpf: support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
Date: Thu, 19 Nov 2026 16:22:26 +0200
Message-ID: <20261119142231.2612515-5-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119142231.2612515-1-razor@blackwall.org>
References: <20261119142231.2612515-1-razor@blackwall.org>
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

From: Daniel Borkmann <daniel@iogearbox.net>

Accept full SOCK_RCU_FREE sockets, including listeners, on TC egress,
taking an skb-owned reference. Request and time-wait sockets remain
unsupported. The BPF TPROXY use case needs to assign a listening socket
(e.g. Envoy proxy) to an skb from tc egress. With netkit, the BPF program
runs on the container's egress side and returns NETKIT_PASS, which delivers
the skb to the host via __netif_rx -> backlog.

The fq qdisc discards listener assignments; ordinary loopback also drops
egress assignments. Both can miss the selected proxy even without GSO.

Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Emil Tsalapatis <emil@etsalapatis.com>
CC: Ihor Solodrai <ihor.solodrai@linux.dev>
CC: John Fastabend <john.fastabend@gmail.com>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: Paul Chaignon <paul@isovalent.com>
CC: Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>
CC: netdev@vger.kernel.org

 include/uapi/linux/bpf.h       | 5 +++--
 net/core/filter.c              | 3 +--
 tools/include/uapi/linux/bpf.h | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 45e3018fb2ae..e8a7ebee305c 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -4612,7 +4612,8 @@ union bpf_attr {
  *		interfere with successful delivery to the socket.
  *
  *		This operation is valid from TC ingress and egress paths.
- *		On egress, only full refcounted sockets are accepted.
+ *		On egress, only full sockets are accepted. Assignment takes an
+ *		skb-owned reference and releases any previous send-side owner.
  *		Software GSO segmentation after assignment is unsupported.
  *
  *		The *flags* argument must be zero.
@@ -4626,7 +4627,7 @@ union bpf_attr {
  *		**-ENETUNREACH** if the socket is unreachable (wrong netns).
  *
  *		**-EOPNOTSUPP** if the socket is unhashed, or TC egress uses
- *		a non-full or non-refcounted socket or a decrypted packet.
+ *		a non-full socket or a decrypted packet.
  *
  * long bpf_sk_assign(struct bpf_sk_lookup *ctx, struct bpf_sock *sk, u64 flags)
  *	Description
diff --git a/net/core/filter.c b/net/core/filter.c
index feeb752f7a00..4dea2cc84712 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -8123,8 +8123,7 @@ BPF_CALL_3(bpf_sk_assign, struct sk_buff *, skb, struct sock *, sk, u64, flags)
 
 	if (!sk || flags != 0)
 		return -EINVAL;
-	if (egress && (!sk_fullsock(sk) || !sk_is_refcounted(sk) ||
-		       skb_is_decrypted(skb)))
+	if (egress && (!sk_fullsock(sk) || skb_is_decrypted(skb)))
 		return -EOPNOTSUPP;
 	refcounted = egress || sk_is_refcounted(sk);
 	if (unlikely(dev_net(skb->dev) != sock_net(sk)))
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 45e3018fb2ae..e8a7ebee305c 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -4612,7 +4612,8 @@ union bpf_attr {
  *		interfere with successful delivery to the socket.
  *
  *		This operation is valid from TC ingress and egress paths.
- *		On egress, only full refcounted sockets are accepted.
+ *		On egress, only full sockets are accepted. Assignment takes an
+ *		skb-owned reference and releases any previous send-side owner.
  *		Software GSO segmentation after assignment is unsupported.
  *
  *		The *flags* argument must be zero.
@@ -4626,7 +4627,7 @@ union bpf_attr {
  *		**-ENETUNREACH** if the socket is unreachable (wrong netns).
  *
  *		**-EOPNOTSUPP** if the socket is unhashed, or TC egress uses
- *		a non-full or non-refcounted socket or a decrypted packet.
+ *		a non-full socket or a decrypted packet.
  *
  * long bpf_sk_assign(struct bpf_sk_lookup *ctx, struct bpf_sock *sk, u64 flags)
  *	Description
-- 
2.47.3

