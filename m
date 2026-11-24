Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531852;
	b=hZVIunMXsMOh+K88gczVBf5R0pOg4sGrIu5as6d9R1cbYi1nH31v7fhnZWxBeGNE37tH
	 xKtnW9K4QUp78nxObdQ3t3K2kheHx73u6bGoJFJN5bvmT3f5e9B1YgqxkoSnDAsyeAUZg
	 y842H9qLhU4aFRxn8pZo2WCNstV7hcSZhICICROn96lh1iHdDpmelVV8CEhM18M2PAXJk
	 52RjRQ/kBkCOSqePuy/zlNJeIlSJl6ZYuSqy8qSVRkawjNC2Sxpj5af/Z503jWEqjEjQR
	 cNUXlTfxAtfRFCZbuZtxbxCG0owsYi9fDd+ZOQxDS/jXnw+ds6RwlBlcUPAc3f3ILEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cqpJMVDcI6RbJhyFDHk1sH3juPS+chDXW4qLSUHX3QM=;
	b=tjJIwEtkuQGKoaPLZSI4fLrqoi9WBrG/PhAf+DoXWN+RCtt0x8J2Fb/yAG7u1wz+sNIl
	 goTF68Tas4zTWhzucRzvg1diGFtOOaR2re7uj7qPt5G6ul1GGx120QF0wFCYi1Mk0LB2n
	 yLtq19P5rfZ2ariMFdGKqadzUvK9dUj3xeY86cHYjO2zJAJmnZ3iStufnTnM4x45ewxh0
	 qw7JEFCsDjHjTXlKgxPPdEJoJeWkkibnwR4RH/IsMxstGJlr+cLJoXzx/EfLy1CoQDGFG
	 MgOYIVjr1D1lnNRw5iTq0J31H/dPJs8Xaw5/FHE+Rz92T7Jx+Ul2r/C3iNQS+9kMN+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+PpQxUM;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442D606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D442D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+PpQxUM
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385c497bf94so224467eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795531851; x=1796136651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqpJMVDcI6RbJhyFDHk1sH3juPS+chDXW4qLSUHX3QM=;
        b=B+PpQxUM/HIt53cx0GXcfD3AVOb/Pt1uFe71Hq5AUMObRk0U9PG8SJTq7C48g9e46Y
         MsUVdRgQnBySkdUW1KHDpOqIpCFjUMtF/bEza87GtAXnKzXk5U2pyxix9qSXD2P4n3sQ
         pZuRQyqugvdAxvKS9P5Bfi1SgCOp7xsDhej8PpCehdylwRXTdhjh3Z2ae9TG0076em01
         VaQ9kl6d/V1AAF1auxwW1fxICUahoJ1U3vQTgCeR2yzTabt4Di1NHXfZW+FpPPn9xoxH
         MK+lZA4BBivqL/rPUpb4kOKKpYIfen1E59DcuWGJW8twzSHEFtETylknZfu/yeKql5Rb
         gyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531851; x=1796136651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqpJMVDcI6RbJhyFDHk1sH3juPS+chDXW4qLSUHX3QM=;
        b=NiXVKDKDKAxqZ930HXzd9DaOV7Uz0M3XKbZlDTSTI4mDguEYr5+wYJ4DTjA5Qgkdu8
         TjbfvHmRTDZjYcHTn/Ln2INTemtUgsgmlNw2YKnpLGaY3+qNgywvedqHWyA/R9dDNVxS
         Gxi9oZJAIhxjfXWJF/DacT9xcvFWCO4dHlKcEaZ12HbcGly3twKV22ioAD9uqnWmU7S0
         R/BQxA0Op/160YkbrZqzSeg2mxWuuQiANaaA7z1rWm9w3fxFQ1ekHkBIlVlwKUxm6BBO
         8IEshqh45K6povzmMevxqUExSoGll4nL/+nSLqUNd78dTCyn4KtkB1tZmefm+7bh1clV
         k5pA==
X-Gm-Message-State: APuU4Z/SmCAfUn5gOAs55kEoywn/jvobtfkt210LB78/xfGkJjktwA6N
	Jr7/F1+HG/w1wY9tKiEbAc6Ppd8CrbWAzdPdvQXxMHbHFVBRceXwqUNLjKfjSr1ctAM=
X-Gm-Gg: AZFdTZcSDJNnLX/15p5Gia+h4oNx+C5OQa4jGalqNnwo/qeBSa6AlVi43aCnIx/uiAm
	3S7f30Qzygor9QXEB06ViGdTqiQRgedLWemF8ZXkTygczMDzqaHm1D9Sn6jKD5WkxuixaHXvoS6
	lOoahOtNfKR3RPkRZtTGQV+tbVHlyaZhsbMxjGlSQVG762wcXUk7jXFAsIm09u63FN0yjsnMFKP
	opdcRLN/zeMiRV8k0vt6A3XbLLyxpuCG7CZhwjlSsWMx8B2aCf5N6xtzBHRmtBO6TbQKiABxXW5
	B/CAQoBAnnilWrnbW+VUgigkO51G0p18Y5FeUh1ZOvoKXMNoxnMVo+M14oe6QltcKJu/NeTqN/L
	3iAC7XjbSabnrnrPFd+FC8M5yuC4YLkz77eqEOhLiShatSCpHTz70ikJm5hV7FXf5buFkLV1p77
	tSEmHcS3ogWM9lcuooCw9B8Qo8BbMJyvYyzYVfyu38tM+5c0T5sfxn6y3/yE3oWa58ioNjsUnS5
	RLIGc19BkENUXOn0a4Ml2bCu0fTdGXS3U7Buv0O284mxr8mhFCRfA127JGgHnxrIxJ1/ZND6XTm
	r95S2h7rTsU58u+CQrFjZnrt+gdEfZhNkDPRNw6DDDckl9HXP00JbSeiooAG
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr17978338eec.24.1795531850725;
        Tue, 24 Nov 2026 06:50:50 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm20684238eec.18.2026.11.24.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:50:50 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	shuah@kernel.org,
	netdev-bot+sashiko@kernel.org,
	Minxi Hou <houminxi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v6 1/3] net: openvswitch: read the datapath features once when sending an upcall
Date: Tue, 24 Nov 2026 09:50:31 -0500
Message-ID: <20261124145033.627044-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124145033.627044-1-houminxi@gmail.com>
References: <20261124145033.627044-1-houminxi@gmail.com>
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

  v6: split out of the fix v5 carried as one patch. Reading the field
    once is an older and separate crash, so it stands as its own patch
    with its own Fixes: tag (aea0bb4f8ee5, the commit that added the
    second read).

 net/openvswitch/datapath.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index b2a0b09fd4a5..96baa2488c26 100644
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
 
+	/* A concurrent change to the features can land between the head room
+	 * decision below and the padding after the copy, which would pad a
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

