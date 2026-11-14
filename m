Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694543;
	b=NhVrTZl8nSWlLwco85PINrMBC0h3RerBvsKBDTlH/5unGnfDXrkeOaCzaziUu9aLRu4S
	 zE1oGonmA/dhw0DvzYPEmi8e+KCwOo9RafXoBOuuy3PNCiO9y8/Zg8RyFbnrF0AIKSPS3
	 hqZ+ilhuMyUIaVFLZQSTwrScqcqi26g4qlWNOAGl4/f26LSlbEDSEqgrFAgCzHC+9W3Dk
	 4JP76kwYbLwMAoeYLSNRZSPARgJbGDjWbe+1OT8pd/UXQ7UTK425ApHK9gFyQAX/XIFAv
	 RGI6dm6eWUdO+zSDz4oN4zRQelpB4Qu4a23yxvWeoFxtqHa1fl6DurMaTXwFa/TIaLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2j2oVR4Q480AJsjIALbdBXe9/iBu5Qr0seMdc8KHqmo=;
	b=p4fXwGcadjbTf+7880C/sYXLU187QjnUtJuGYkuMm3a4vMhEHTQPq0t8CcGgjTNBQuzP
	 WmpQTzSacZXJMRE4alblX9DVqIE7XiN19Pj+zlgskTMR4HPBRFdQU3rlYB6UzLgas897h
	 0NSRSy9PiiiZsVxiqfJhXjHTRCcbVcKKnnVCJLPyKldoLNwtmK+3RU+I0v/4wLV4y1c2b
	 CSuw10LCT8k82UGfHdEZ+T3iLTfYlgzJ48zAFEYzow/oHCGs499lDSGRNWuaR4S6USzcJ
	 2sGvgbAcCdO6V/P5i84rqIRYal+6KhMOd2+i1Zu13iRbqgNievTnhIjfnzFZ9EVG6mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWV0079H;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2B60A2607
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E2B60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWV0079H
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so1120915f8f.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694541; x=1795299341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2j2oVR4Q480AJsjIALbdBXe9/iBu5Qr0seMdc8KHqmo=;
        b=vWV0079H7Frq6RJFDtmzChHPcSfpdr9qbB4e+jBF08/WHuSLfgNXUM0YRMjytGx3iX
         2uwE97IqlOA5+zDLUK4bm2z0CWCIp/1Pn69KIkS+wLFjxusgFNxweLPUtuEOkyOkKMT7
         s9hCH7kz8M56rp0IvrWG3e+kEgNJla6hQM2Cn3Eo9rHXC6uwE+ZWVmdvvz0rKg5pTZ6Z
         L1EE4ks8BhfXaK8H+OjC5JzIg1CZWHt0z9bbxuAhyieOB9SE+TyyMsczNZG/xXl1e/SF
         HNryTSfG5nBWnOPlvlYuTNWmrAdu3YB5puHdEt8/BmWIEVpwTnHz5hKGecv2RGShh7Dz
         oCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694541; x=1795299341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2j2oVR4Q480AJsjIALbdBXe9/iBu5Qr0seMdc8KHqmo=;
        b=SPNsFw/FE6MidGxjZ+pFs6wEVhCVk1SctXIV9AKptsLmGJPXdu7pKZ0TITceWBFI1H
         hcpzlxSQdAntT0AH6PF08PBqellEtxNZ8VfbYPVCtAjJnQ4QlO8SOGcunSAHv+4Wtq0K
         tlPNMrMaPFLmjzmyAJeYoVDsVDt+qeFquEWO0Md0l2JqThS41+Z+Be7+tJCyv4jkjcLY
         QCtKdphxG0h6offZZ7OAIubFwdyem1lyeavAPRD04bTxJhxntH1eZrjBre/ewrlQd8qH
         pijK5wCH4+SNLMqDfKa6hhkHZ9QuLHvEIyOIz+sUdmJ+TrY8/cWmRbJGiRbmW5T8upIt
         RbiA==
X-Gm-Message-State: APuU4Z+KdnKBegz/LDA5jfQroBD43kyd+i9gmdV6/Zn0rQtoOHBTjTWT
	Azn4L5flIk3PVppwHV3V1PhP0iXaD+w5GshsiTfo4xt8HGxikFmNs68gJmQ8qID88Bc=
X-Gm-Gg: AYBFou3VccyiBrkwG2yQHVM0InGIDzfV7uA1vvZVWxM54oxe0ylWDJ2j/9omFmaWuCt
	up2b7rg1n9UehTO4Ove8jwoD/6OBSrDtv6fdQIvjVvQtea40ySapSlin5oQWaXCcQwI4FsOMaN8
	ERKc8jCEPIITrgjuIfEloWHd2xXqobtf7XQXxcpg6CuWAMzFzjnPjF7MX6vju2QdYnE7SXZBlIJ
	MdzbLOEN5CayFDB7fyNAOCQiUw/y6xlGqWiNeOsyLoe0XnsoEnkAi0c9oTdbRr9ykGamKe3D8CJ
	t9yunrR7PQ0dXo2e0q+F/0Fq4m6FMJQbxpcXTASAgYWsa6WyIywf6D2gQgdIAXfnHmYVEvIo8/D
	p25i+lCo87jN4VdjRsizHWib5joLcj35bA8BAIhFvn8Lri9eEVIE2rtu/NjQTPXoZ0W8prQqoMc
	LsqLT72IXIWjcTu8z8dKD34ywSM8pSo9yFMP9vON+9qGfLF8oSVTyQ96x7js/S4nnshh+4Igj3k
	CAogNXHvW3qDf9etEQEfr2mZy5Yo+NQ3iMNBX20fAZ+sh/u76IDT0CnPftGb8cPtlddQRqmRdf1
	0QM9hfmcaBYWCSVkfJb5cMs=
X-Received: by 2002:a05:6000:26c8:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49c73631471mr14640010f8f.23.1794694540890;
        Sat, 14 Nov 2026 14:15:40 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:40 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 3/8] vxlan: vnifilter: bound the number of VNIs one request may touch
Date: Sun, 15 Nov 2026 01:14:07 +0300
Message-ID: <20261114221412.255825-4-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

A single RTM_NEWTUNNEL or RTM_DELTUNNEL message can ask for the whole
24-bit space in one range. vxlan_vni_add_del() then walks it one VNI at
a time under rtnl_lock, holding the lock for the length of the walk.
That walk is the cost being bounded, not the memory: an add allocates a
VNI node and a per-CPU stats block per VNI, a delete creates neither,
but both walk the same span and hold rtnl the same way, so both are
bounded.

The span of one VXLAN_VNIFILTER_ENTRY is not the quantity to bound. An
entry carrying just START and END is 20 bytes on the wire and a message
may carry many of them, vxlan_process_vni_filter() being called once per
entry, so bounding each entry alone would still let one message ask for
thousands of times the limit. Sum the spans of every entry and reject
the message as a whole in vxlan_vnifilter_check_msg(), before the
dispatch loop: entries are applied and notified one at a time, so a
limit enforced during dispatch would return an error only after every
preceding entry had been acted on. The range extraction is factored
into vxlan_vni_filter_entry_range() so the count and the range later
acted on cannot drift.

The limit, VXLAN_VNI_FILTER_MSG_MAX (4096), is the one "vxlan:
vnifilter: clamp the dumped VNI range to the request limit" introduced
for the dump, and its comment now names vxlan_vnifilter_check_msg() as
the input-side limit. It follows the usable VLAN ID space, since
vnifilter is mainly used on bridged devices where the VNI is derived
from the VLAN. It bounds one request, not how many VNIs a device may
hold: the whole space can still be installed in more than one request,
and a device holding it is still torn down in one step by
vxlan_vnigroup_uninit(), which is device teardown, not a netlink
message, and is not subject to this cap.

Found by code review of the same request path. In QEMU on net-next
(production build, 2 vCPU), one request for 1M VNIs took 1.6 s; an RTNL
request from another netns started 1 s in waited 0.6 s.

This is hardening for net-next -- a policy narrowing of what a single
message may ask for -- and is not a backport candidate.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: the VXLAN_VNI_FILTER_MSG_MAX comment names
vxlan_vnifilter_check_msg() as the input-side limit; the changelog names
the dump patch by subject, says this is net-next hardening, and says how
the walk was found and what one large request costs in QEMU (review of
v4, sinfo bot). v4: use the constant the dump patch introduces; rebased.

 drivers/net/vxlan/vxlan_vnifilter.c | 86 +++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 66a27198c65d..127ed5b2a2eb 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,8 +17,10 @@
 
 #include "vxlan_private.h"
 
-/* The most VNIs one dumped entry, or one dumped message, carries: the dump ends
- * a coalesced run, and a message, before either would exceed it.
+/* The most VNIs one RTM_NEWTUNNEL/RTM_DELTUNNEL request may touch, summed over
+ * its entries, as enforced by vxlan_vnifilter_check_msg(). The dump ends a
+ * coalesced run, and a message, before either would exceed it, so no message it
+ * emits asks for more VNIs than one request may.
  */
 #define VXLAN_VNI_FILTER_MSG_MAX	4096
 
@@ -970,13 +972,79 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
 	return err;
 }
 
+/* Derive the VNI range one VXLAN_VNIFILTER_ENTRY selects. Shared so that the
+ * count taken by vxlan_vnifilter_check_msg() cannot drift from the range
+ * vxlan_process_vni_filter() then acts on.
+ */
+static void vxlan_vni_filter_entry_range(struct nlattr **vattrs, u32 *vni_start,
+					 u32 *vni_end)
+{
+	*vni_start = 0;
+	*vni_end = 0;
+
+	if (vattrs[VXLAN_VNIFILTER_ENTRY_START]) {
+		*vni_start = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_START]);
+		*vni_end = *vni_start;
+	}
+
+	if (vattrs[VXLAN_VNIFILTER_ENTRY_END])
+		*vni_end = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_END]);
+}
+
+/* Reject a request touching more than VXLAN_VNI_FILTER_MSG_MAX VNIs before any
+ * of its entries is acted on. Both add and delete walk the span one VNI at a
+ * time under rtnl_lock, so both are bounded. Entries are applied one at a time
+ * and each one notifies as it goes, so a limit checked inside the dispatch loop
+ * would leave the entries ahead of the offending one already applied.
+ */
+static int vxlan_vnifilter_check_msg(const struct nlmsghdr *nlh,
+				     struct netlink_ext_ack *extack)
+{
+	struct nlattr *vattrs[VXLAN_VNIFILTER_ENTRY_MAX + 1];
+	struct nlattr *attr;
+	u32 vnis = 0;
+	int err, rem;
+
+	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
+				 sizeof(struct tunnel_msg), rem) {
+		u32 vni_start, vni_end;
+
+		err = nla_parse_nested(vattrs, VXLAN_VNIFILTER_ENTRY_MAX, attr,
+				       vni_filter_entry_policy, extack);
+		if (err)
+			return err;
+
+		vxlan_vni_filter_entry_range(vattrs, &vni_start, &vni_end);
+
+		/* A start above the end selects no VNI and costs nothing;
+		 * leave it behaving as it does today.
+		 */
+		if (vni_end < vni_start)
+			continue;
+
+		/* vni_filter_entry_policy has already bounded both endpoints
+		 * below VXLAN_N_VID, so one entry adds at most VXLAN_N_VID and
+		 * vnis cannot wrap before the test below rejects it.
+		 */
+		vnis += vni_end - vni_start + 1;
+		if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {
+			NL_SET_ERR_MSG_ATTR_FMT(extack, attr,
+						"Request asks for more than %u VNIs",
+						VXLAN_VNI_FILTER_MSG_MAX);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
 				    struct nlattr *nlvnifilter,
 				    int cmd, struct netlink_ext_ack *extack)
 {
 	struct nlattr *vattrs[VXLAN_VNIFILTER_ENTRY_MAX + 1];
 	const struct vxlan_config *cfg;
-	u32 vni_start = 0, vni_end = 0;
+	u32 vni_start, vni_end;
 	union vxlan_addr group;
 	int err;
 
@@ -987,13 +1055,7 @@ static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
 	if (err)
 		return err;
 
-	if (vattrs[VXLAN_VNIFILTER_ENTRY_START]) {
-		vni_start = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_START]);
-		vni_end = vni_start;
-	}
-
-	if (vattrs[VXLAN_VNIFILTER_ENTRY_END])
-		vni_end = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_END]);
+	vxlan_vni_filter_entry_range(vattrs, &vni_start, &vni_end);
 
 	if (!vni_start && !vni_end) {
 		NL_SET_ERR_MSG_ATTR(extack, nlvnifilter,
@@ -1103,6 +1165,10 @@ static int vxlan_vnifilter_process(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (!(cfg->flags & VXLAN_F_VNIFILTER))
 		return -EOPNOTSUPP;
 
+	err = vxlan_vnifilter_check_msg(nlh, extack);
+	if (err)
+		return err;
+
 	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
 				 sizeof(*tmsg), rem) {
 		err = vxlan_process_vni_filter(vxlan, attr, nlh->nlmsg_type,
-- 
2.53.0

