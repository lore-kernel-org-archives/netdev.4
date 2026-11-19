Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107964;
	b=jaEMrWQIf0w51fY5CA+1hHfT6ch1L8M3jseh10dSSwzUPPz1Fs2KHo6ohwrc79RWAL+R
	 eBQKL6own+g+96X5qMqITtSnHq3SV8w+BCQuXm8RoiWQ0vXO1dSTBmT0MyVHIzL5D5Nq7
	 rqH1d9xQ4IgImA7IupXvCeKiIu45KCwnT0DY8GstFijI4AdkZ7g9FgHALc0uR/qT0Bc6U
	 6FFN1vVpy98yGPxzQOD2t/dY24a6KCvzkQwEJPAxZFQfUGMc95TlfOhflXBc8uqQX/k4l
	 cWfVj0Phlq5p76V8J5XrJI6TPaym1pRQl7MJOsH02jUhDsCta2/Os35upgNFwW9YjuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
	b=4xvofOn9/BH8UcCXAkZJkaHBnsbRtZTGYuLx86EKb8WB++dbxkhGaWJHnNmhy70QYO/W
	 e5Ce1HAZcLy4BBUqBzlsjXWL1+zRfA+scwkuIH1bn4p38Y4xvE/8xEuqVz+ahkVuYh9mt
	 57OdbkrJSD99SjrXiLJ+K4YDqmYsZQ8yRpslrBiAQ+MmWu2NzhMMfDJp3SHJDvuB1GTve
	 glw1JbHQOm/JCXL0rSj0Jr/4x0os3Cv3XzSuITazKChClYTAoArNpAoYdR7+EF4xR3ONw
	 QvJqZ0np2SgJC1EvtLvYPJQIXTfVTg0NfuDI8woZN4b3c1zOjTJ1Rr9K4fOmQdSseFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdC8JO5c;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D4606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04D4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdC8JO5c
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2715664eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107963; x=1795712763; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
        b=AdC8JO5cfYkREzBuevSsmBRofyeI2viaNdzDHn22fr5zHup73OzTY3NnOWjx8+gR0H
         slfgJ589QAW3d71exm+NVYNH22zUkwviQImI6St9JAHQ7XQisL1Wauv1RNIjWSyNtDAV
         f1SwR74ongcjXN/5+SWXfwvl5qGjVyyLsTrnl/ITt9tbeLTFW/E64tzpQUNSqgBjH9Vg
         OkmvgI+Uss1oalxYeB3K0h/Zv895W0dTN/0xXn2ClA+rg5vhATHczFlWEljWFmJRT/47
         4/bp0BnPee/FEc+IMaPVhet7FvufTKFGTAhZVT34AG8vcATrAhlgfHjKeLETqOmhAfZN
         R1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107963; x=1795712763;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
        b=xfxON4UNOw0zwfwnDC+nv7orD/qPyTkFu2igwHXbqFifYmcc5nHZjQzjgwa7l3A9/8
         7Xhe605Pk6ZPaN1aRL3McDTxhX/XmaSFKcTa3zwmXkz9OX+IQK8ue/GUMgjcIJm0GLXD
         vD/RLZLYT2MG31chD1a6BLvilTXq4Gt7yZkb9l+DbfK7QBkO2fQj43IRzcQPEf8+ORiW
         kMsElPj87fLz2J52JC5q3WHDrM3dgvy6vMX+C01AhmbOcKHZfyGVWvyAhS47neEcQwBE
         oC3u2gZ73HuK4f6scg4SamVTQBYd8H31abm1Ev8SMZVFaUhIE/B5MMdsdEdn2s3j2otu
         iILg==
X-Forwarded-Encrypted: i=1; AL+hErE52UqeStGLiC9tLr+Vgm3ykI6GIzFiBYhcTWvUnxi3PPT/3W3apndTGqDz8hAug4Gp7x1mb6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZtsMGOnGfcbihSFUOIrNU/12US/m2YstFw/XB4Xpl2J9Mm042
	apua5VFTlXDjuUY5cGZ1GMZ65ncjpNMCewPqCmnisO3vB1CFA2HDmJLtWcSU9iAMPYqthjTgOB4
	tp1focsZEUw==
X-Received: from dldz5-n1.prod.google.com ([2002:a05:701b:4185:10b0:1b5:1a6c:af8e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4196:b0:1b2:3b5b:b80b
 with SMTP id a92af1059eb24-1b55689ee3amr339019c88.8.1795107962438; Thu, 19
 Nov 2026 09:06:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:56 -0800
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
Message-ID: <20261119170556.1518068-1-irogers@google.com>
Subject: [PATCH net] tipc: validate peer address attributes in tipc_nl_peer_rm()
From: Ian Rogers <irogers@google.com>
To: Jon Maloy <jmaloy@redhat.com>, Tung Quang Nguyen <tung.quang.nguyen@est.tech>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

tipc_nl_peer_rm() documents TIPC_NLA_NET_ADDR and TIPC_NLA_NET_NODEID as
mutually exclusive ways to identify the peer to remove, but implements
them as two independent if-blocks with no fallback check. If a
TIPC_NL_PEER_REMOVE netlink request provides an empty nested TIPC_NLA_NET
attribute (or only unrelated TIPC_NLA_NET_* attributes), 'addr' remains
uninitialized on the stack and is passed into in_own_node() and
tipc_node_find(). Conversely, if both attributes are supplied, the second
silently overwrites the first.

Return -EINVAL when both attributes are present or when neither is
present.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wconditional-uninitialized; not runtime-tested over TIPC netlink.

Fixes: 43fcd906d9c1 ("tipc: support 128bit node identity for peer removing")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/tipc/node.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/tipc/node.c b/net/tipc/node.c
index 53b0993c2c23..d19ed94b8f41 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -2277,18 +2277,21 @@ int tipc_nl_peer_rm(struct sk_buff *skb, struct genl_info *info)
 	/* attrs[TIPC_NLA_NET_NODEID] and attrs[TIPC_NLA_NET_ADDR] are
 	 * mutually exclusive cases
 	 */
+	if (attrs[TIPC_NLA_NET_ADDR] && attrs[TIPC_NLA_NET_NODEID])
+		return -EINVAL;
+
 	if (attrs[TIPC_NLA_NET_ADDR]) {
 		addr = nla_get_u32(attrs[TIPC_NLA_NET_ADDR]);
 		if (!addr)
 			return -EINVAL;
-	}
-
-	if (attrs[TIPC_NLA_NET_NODEID]) {
+	} else if (attrs[TIPC_NLA_NET_NODEID]) {
 		if (!attrs[TIPC_NLA_NET_NODEID_W1])
 			return -EINVAL;
 		*w0 = nla_get_u64(attrs[TIPC_NLA_NET_NODEID]);
 		*w1 = nla_get_u64(attrs[TIPC_NLA_NET_NODEID_W1]);
 		addr = hash128to32(node_id);
+	} else {
+		return -EINVAL;
 	}
 
 	if (in_own_node(net, addr))
-- 
2.56.1.708.g77570a6a1d-goog

