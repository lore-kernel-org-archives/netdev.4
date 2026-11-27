Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801418;
	b=aR3XJjhWEF3+ZAecMen1Eij9XirBlVm1ZLRmU5CJnxkeLqw1oMEVxNe7tGc5yca0aWAD
	 cdYEqwqfReZkwW8CsurRqYET0BwyHm9UU+m6MeTQ7zlG0hVNvzmaaDwYInoHzfI+QC7HJ
	 5dee3pNA//yVwzOXqA2hU3U82ITIfTXcPCdwIdS/j/eRmEqrTAkAxRu/lIKaB59f7vjvK
	 Ke3H3IML+V635h2kmWvfzw82OixiHsP78m1eHvN9EHU+wFypWp+KPaCrXUaABMxIQGac+
	 tBsILVJRikQXlrbZPoz7qgFSvbDHPbYvHM3hbShubg7ASLmxkdz4lllWUpKAxuCXAHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yn4mQCUI5qr9PM3eIzwoaE+VdU0Efk/xEsMG5+tzYoM=;
	b=OjuuAzjnJWgDe2PEOJWL41WfTISLAbD5xyVkn8QmYkHsG2CbmmfdQs609dEoreZDFTd5
	 DQ+FbWbN0aF//I0jW5WhMJVLJeFv/JgiBJGdg8D1zYDYpzWy2RSSO9EwCZEo7osnPZlKw
	 BvJ4QFfv9ew2Ui1uATAgz6z0X3VPxMHYbikdPHxHFF/A7T/BYxOPKklZJBDmEj5vEmcCh
	 cNdwXyjyvrgk2w6PolCTMPwhhXcWScyM/DXixdxz17+Y8JzhBw4lgY3uXHxDDaaSIewft
	 asWPm/so4igcNS11VFxtxPkIG54iDOMjvSM6d3Xzk79foImvOMH3BBlXyVy5pYQKzRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yD/vlBQ0";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C8606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61C8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yD/vlBQ0
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so11489725eec.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801417; x=1796406217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yn4mQCUI5qr9PM3eIzwoaE+VdU0Efk/xEsMG5+tzYoM=;
        b=yD/vlBQ0bSHWfZ6ahtyvR/XJp8HHCa8YshGy//t0bcHFZ8MwYwZc6MluylDU2V7kxo
         hWgFJeBXIa0tYtW7F1uK9mykgeBnoZgFf4rvdxyuUUB6LLZ3Zdg4ArCltypWBbQEsB/G
         nx+xXTr/d9gPfHuu4BPZTxx6Aqykmw7eRNFCpRLz+e2rjN/C1LgTXyHr/imIBLYDH1kY
         vkLTmD/8oRpZgmFA1+BN5S84qjj0Y6vWi2A2/XUBwOycV2S2Au4+jgoVC1nYH2gEmR7Q
         i8GYB/xVgonm9ECR8hOaZF3vygjxG41ukFrrn018EK2Z0JTrvOol6IeMLTNLkQlyfftD
         MJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801417; x=1796406217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yn4mQCUI5qr9PM3eIzwoaE+VdU0Efk/xEsMG5+tzYoM=;
        b=vLm+ELJJMMXhF7YF7pJ/BPqn//xop3ffUERSTaGzOpXiG429jgJmAp7dNfE2ya5sAk
         ueQyRIUBzYWqM6fprRYipYIbvgq1te3yTgo4X+ijpdTu1sR+QzLzwybbydSLUJzV7Qws
         +mGGFAeIRNoVjbkFAGuhfXfM3eD2CvFHo4AgK+pn7xVqAwjL/tZbMw96IQeQE5TKJeb/
         dfgDRUMtLuuoyKtrMzwFr1Tx6n6yoUIDdZ2NqfqNVSpf2lUMgh5904QAS1NyOj7AIhT/
         xbDCxv0UsK6bhSp45z+zdYpqiVQFjm7dZG9nKk7NhcFqkvbyUvJ86bXSvzxqGaW7CRtL
         v1zQ==
X-Gm-Message-State: APuU4Z8FIT77Q9cb4f7gHx2HQFTGeQG/I/HzEvBn2iJ1E7n4Jht7GZFC
	ACBTxIQk6p+c7RZx1FP/ZmpgwHHr2WWwZf3feQg7ZJ2KpC6Z+0L6dbFlIhdSK3la8mw=
X-Gm-Gg: AZFdTZcppf3iZ90eYtEmvSqlpqdpT+AVVlxa3XUzz2zOQflo0euBL52v5os5LCq2MUl
	Y5otjrCUcXW9seJG5+5GtgLaBm10UG3s+SilUAApea8Txxms+u2VIMnpCHtslY5bd3+dRpSAhpR
	M8gbBYhJYnOiqAOOYm0r0G7qjxvV5ekWWceC9IgoYt2ZNYP3KPpSYWn8RqKtvqcagfJLW28KqWD
	ERUGj30VDVB7GbIsCV/zSUfcto6VTCcxPS8tOEMD8rA7rJ0oNPMI3aphJeO64BDwHS7HzRScYxG
	nCVPPr3h4tfG2AYjgDDWTDHkM6Xdf6JcK+Q8Ucp0p7ZR9DgG8PqB5WaFo9kgNTLV590alsppHWN
	+qe8PJC3I9eimSJVV0g+JuLknC2Z8sFr8PxXGwKM9d6GDg4uGXV1yVATdRBeI9EB2AXjdjIxY+h
	D8LnfaKJen0MqzoIccpZJlLjwEP5vmR+ja1Fwfc5sWrJiH9PUwWDrJhWfyp9I3w7bBDhWaeUpWj
	aChNxCL90IKbDmIzxg2k2325tkvJJx4zH72VARVy7tK40OUFiRvQyazlz45da94pEQTgFmj8y8z
	mBcQbgOAKDvq2sPXYPt9qx61P358zXafjup90ex0bVP46oyXD9tlI454gmSAQwyY3gIN1CXyrCr
	vTu7D
X-Received: by 2002:a05:7301:787:b0:386:c6f9:b56d with SMTP id 5a478bee46e88-386c6f9b68cmr10335129eec.16.1795801416638;
        Fri, 27 Nov 2026 09:43:36 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm66064276eec.8.2026.11.27.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:43:35 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@kernel.org,
	horms@kernel.org,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kselftest@vger.kernel.org,
	matttbe@kernel.org,
	netdev-bot+sashiko@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	stable@vger.kernel.org,
	willemb@google.com
Subject: [PATCH net v7 1/3] net: openvswitch: read the datapath features once when sending an upcall
Date: Fri, 27 Nov 2026 12:43:13 -0500
Message-ID: <20261127173039.ovs-features-v7-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
References: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
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

queue_userspace_packet() decides from OVS_DP_F_UNALIGNED whether to copy
the packet with skb_zerocopy(), and pad_packet() reads the same field
again after the copy. A concurrent OVS_DP_CMD_SET can clear the bit
between the two reads, so the copy leaves a nonlinear skb and the padding
calls skb_put_zero() on it. skb_put() asserts that the skb is linear, so
the kernel oopses, and a host built with panic_on_oops goes down.

OVS_DP_CMD_SET needs CAP_NET_ADMIN, which a user namespace that owns a
network namespace provides, so the window is reachable without
privileges on the host.

Read the field once and pass that value to pad_packet().

Fixes: aea0bb4f8ee5 ("openvswitch: Pad OVS_PACKET_ATTR_PACKET if linear copy was performed")
Cc: stable@vger.kernel.org
Signed-off-by: Minxi Hou <houminxi@gmail.com>
---

v7: the comment now says which decision it guards. The code below it picks
hlen, the number of bytes skb_zerocopy() copies into the linear part, and
never chooses head room. Sashiko pointed that out.

 net/openvswitch/datapath.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index b2a0b09fd4a5..8124b298c75f 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -439,9 +439,9 @@ static size_t upcall_msg_size(const struct dp_upcall_info *upcall_info,
 	return size;
 }
 
-static void pad_packet(struct datapath *dp, struct sk_buff *skb)
+static void pad_packet(struct sk_buff *skb, u32 features)
 {
-	if (!(dp->user_features & OVS_DP_F_UNALIGNED)) {
+	if (!(features & OVS_DP_F_UNALIGNED)) {
 		size_t plen = NLA_ALIGN(skb->len) - skb->len;
 
 		if (plen > 0)
@@ -461,6 +461,7 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 	size_t msg_size;
 	size_t skb_len;
 	unsigned int hlen;
+	u32 features;
 	int err, dp_ifindex;
 	u64 hash;
 
@@ -494,11 +495,18 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 	    (err = skb_csum_hwoffload_help(skb, 0)))
 		goto out;
 
+	/* A concurrent change to the features can land between the linear copy
+	 * length (hlen) below and the padding after the copy, which would pad a
+	 * nonlinear skb and trip SKB_LINEAR_ASSERT. Read the field once and use
+	 * that value for both.
+	 */
+	features = READ_ONCE(dp->user_features);
+
 	/* Older versions of OVS user space enforce alignment of the last
 	 * Netlink attribute to NLA_ALIGNTO which would require extensive
 	 * padding logic. Only perform zerocopy if padding is not required.
 	 */
-	if (dp->user_features & OVS_DP_F_UNALIGNED)
+	if (features & OVS_DP_F_UNALIGNED)
 		hlen = min(skb_zerocopy_headlen(skb), cutlen);
 	else
 		hlen = skb_len;
@@ -598,7 +606,7 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 		goto out;
 
 	/* Pad OVS_PACKET_ATTR_PACKET if linear copy was performed */
-	pad_packet(dp, user_skb);
+	pad_packet(user_skb, features);
 
 	((struct nlmsghdr *) user_skb->data)->nlmsg_len = user_skb->len;
 
-- 
2.56.1

