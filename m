Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044772;
	b=OJm7BGMLBb1k/8DAYCvGrTlTF3JEv1d/+7ACtwv7qseEtgPiYsc0Int4IsJElRr5eNYF
	 sH08csAeywXjMkKgD8D4jUDpAiytiTcVUc/PtGXZwU09rT8wxYfCWUOQYTcvF9iR9CBnD
	 txxRX60QYtm5150EuV5nXGLsBApuJC8EHy70J/sOq4/Px0BXaZHHTfquNYZJMm5CrmVAQ
	 unlX4yL4Fz7oGEyF8OOm1qS2jG8oRG6XtKxdBbPOTPYZfQMse3TNZGZWDN82KQzvYHzrJ
	 l5vV6Aaf9p4YSNBaf65RkZujQ5ZRkhw8MWqWX2gfSUxUzuxY0YnyxK4+GuZAuhSd9sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044772;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Outbound-Client-TLS:
	 X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=LUSTycxqJrBkhJfvvPPltkcg0ZstsTjIWcuX3+uPTak=;
	b=cG4Sz//gekMgLv361ZhThG7dtt1QveqryVpVy4M+wW2baDroQfssqkiHO2ddJLQ1LNkC
	 wjSqfZh8Ik52JVfI7l+JX35i0JZzvitW4PcBxPTtjJkmFR3MsHjuJHZwy95etLoalk3tF
	 jMI1GicOqFtjdNv3RoQTVhPZTPiUkFAws8Fx5A3Kg6LQS8zr00BlyKWXuS0jpThRmKhui
	 z9Y+s1cG7a/H8gIro8iuHDx1YpH6Y0BhzEGypGN4MVuBK8mN5HJnjK8Eyk1/vEk2CFWkK
	 5Wlszd5uSxBF2VsVHWnOATlRedSSCOBTVMsK9+gdiyP8qzJzcGZ5jlBefxJRorlEdxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=JlB0aH7f;
	arc=none smtp.remote-ip=173.37.86.74
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6023606B9A5;
	Wed, 18 Nov 2026 23:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6023606B9A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=JlB0aH7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=27284; q=dns/txt;
  s=iport01; t=1795044771; x=1796254371;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=LUSTycxqJrBkhJfvvPPltkcg0ZstsTjIWcuX3+uPTak=;
  b=JlB0aH7fjFtL1W+HkvbYL/S+aVd7jQ923WkjrLeo8Qw3yDlX2Pyvo9yh
   EurkM+vhJkJ0i4y9PcHyzBZzvROIsCYo8PiSK6MOmNC48MxVCa/3WuvST
   2SQb05YLf0k5Eg3Tl7aC7gf93QfpvbU4blBtkXr2lYctJfOUjiwnB5DQT
   w4aQ2a+1QyHX2QNRCVFiOILGb5ERpLCoIDoZnUDnwd/dUWuFAofggDupu
   amv0QPopQ3FCAZxItZOyxlO39CQJEcs4CUSNhrtMjEtkMF7Q2pLuO8OTZ
   oBV1QBsb6+gQkjPItRYg9VC26phESZ4AmEX/qtcYxq6Hv1ErAn1Xj06Q2
   A==;
X-CSE-ConnectionGUID: 7J+aLPyUSTSWn3HlIdjlFg==
X-CSE-MsgGUID: MMzsptMsSFCf+EnnobjpAw==
X-IPAS-Result: =?us-ascii?q?A0AaAABDNP5q/5L/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglaBVUNJhFeIG4c4giGRUoxZFIFqDwEBAQ9RBAEBghKCcwKOIAImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGXJATAgEDGgkEU?=
 =?us-ascii?q?hAlAiYCAkYQBgESgwKCdQO5XXp/M4EBhH7ZS4FoAQsUAYEKLgGFc4JuAYFxh?=
 =?us-ascii?q?Ag7hEInG4FJRIEVg2qEHwqDdoJqBIIiehKCX5VgCT+BAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?WNSMwMgCgsSEhgVAhQdEg8EFjIdcAwnEikXL1gbBgWBHHMUBBOBEoEDXYErK?=
 =?us-ascii?q?F0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?wgDGgVAAh8IAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CChgNSBEsNwYPGQQ9A?=
 =?us-ascii?q?W4Hk0uCJmALBgEHD2UJC0I9AypnGgEBSpJqKwE5gzyNXmuBNZ9chCuBaIgsl?=
 =?us-ascii?q?2Qzl2qTCJkII6NKBg8JUIRqgWg8gVkzGggbFYMiUxkPji4Wkx0BvQAmMj4BB?=
 =?us-ascii?q?wIHDwKBc5ACDxcHgU8BAQ?=
IronPort-Data: A9a23:TQJOUqMeDVG1ExHvrR13lsFynXyQoLVcMsEvi/4bfWQNrUpw0jFWz
 GMdDWGAP/mMazP2ettyOo7l9UgF7MWEmIQ1THM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gm4saQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66pMT0gSBZwlwdpMPmcV1
 fg5JDIJQB/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIIk3gOazhnr/WzZZs1mS46Ew5gA/ySQsjOmzaIeLIIDiqcN9u2OKv
 Xra2n/CLDoUd/GZzz2P8GqFmbqa9c/8cMdIfFGizdZmiUOew0QfAQMbUF+8r+X/jEOiM/pSJ
 1ER8zgjsYAx+VatQ927WAe3yFaEuQQZQPJTHvc85QXLzbDbiy6aG2INZj1MctorsIkxXzNC/
 laPk8nkGn9pvaGZRGy18qqSq3W5OUA9NWYIaCkFZREI79nqvMc4iRenZtJiFrOly974Azf9x
 xiUoyUkwbYel8gG0+O851+vqzShupTEUCYr6QjNGGGo9AV0YMiifYPA1LTAxexLIIDcShyKu
 2IJ3pDPqusPFpqK0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:9I4aJqqIhfu+CeuvvC/znawaV5rdeYIsimQD101hICG9vPbo8/
 xG+8576faUslgssR4b9OxoVJPrfZqYz+8W3WBzB9iftXfd2FdARbsKheDfKn/bak7DH4VmuZ
 uIHZIObeHYPBxWgdn35Q+gH81l4tWWmZrY/Nv2/jNBQR5nbqd44xw8MAaUFUVqWBJLbKBJcq
 Z0nvA3wAaISDAwctmxAGUDUqzoot3Gk4+jXDs9biRXkDVnSViTmcTH+9/y5GZkbw9y
X-Talos-CUID: 9a23:8Avvm2BisITwsRn6E3ZFt0cwItEYSUHm83GLA0uZBWRtZrLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A7ycuHA4srWyvysdYJTkOtW5FxoxNxra1EFwoiq4?=
 =?us-ascii?q?okMfHGCp2PD2flB2oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="549605624"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 23:32:45 +0000
Received: from [127.0.0.1] (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id E6AD71800058D;
	Wed, 18 Nov 2026 23:32:43 +0000 (GMT)
From: Satish Kharat <satishkh@cisco.com>
Date: Wed, 18 Nov 2026 15:32:30 -0800
Subject: [PATCH net-next v3 4/6] enic: validate V2 VF configuration replies
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-4-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sesidhar Baddela <sebaddel@cisco.com>, 
 Aravind Dhanasekaran <aradhana@cisco.com>, 
 Reese Faucette <rfaucett@cisco.com>, Satish Kharat <satishkh@cisco.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044758; l=28266;
 i=satishkh@cisco.com; h=from:subject:message-id;
 bh=5l5Qi04D6YPj3WwElwL4euuu/4akaW9PFTWAjZAJBTI=;
 b=f5EbKk4PxE5Z8tyjx0dKVF2CxJeY1Ky/Yb8FOYuU8SyXEgu8HvNW6/R7432nC9bJ7etpHlPBr
 jwS3L/qbTgYDU6a6OGPKKyrv3cq+TFPtJccbowlKHeI40Bzfl87yOAy
X-Developer-Key: i=satishkh@cisco.com; a=ed25519;
 pk=4BxbLoCGvHeIMH/PbpiNVx8/2IcTjFvqcr0AD8K6WLY=
X-Outbound-Client-TLS: ANONYMOUS;unknown [10.25.129.52];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.25.129.52, [10.25.129.52]
X-Outbound-Node: rcdn-l-core-09.cisco.com

Add the established V2 mailbox operations for MAC filters and packet-filter
settings, together with the administrative-MAC protocol definitions and
request helpers used by the next patch. Keep request buffers alive until
the VF request completes so detailed replies can be checked entry by entry.

Validate message framing, echoed operations, result counts, and
operation-specific idempotent results before signaling completion. Validate
applied packet-filter flags before returning them to the caller. If a reply
is malformed or contradictory, or the PF reports that the VF is no longer
registered, the VF can no longer trust that its state matches the PF.
Require a new VF registration before accepting traffic again.

The protocol's ret_minor field counts non-SKIPPED per-entry result codes,
including the idempotent DUPLICATE and NOT_FOUND outcomes. SKIPPED remains
an operation-specific policy result but is not part of that aggregate
count.

Return stable policy errors to callers while retaining retry semantics for
operations that made no state change. A coherent top-level MAC-operation
failure remains an ordinary error. Reserve reconnect for malformed or
indeterminate replies and explicit registration loss.

This patch adds only the VF side of these operations. Administrative-MAC
notification handling is added by the next patch. The in-tree V2 PF enable
path remains dormant because enic_driver does not yet register
.sriov_configure. A future PF activation series must implement PF-side
handling for the MAC-address and packet-filter mailbox requests, including
the VF policy checks, before wiring that callback.

Assisted-by: LLM

Signed-off-by: Satish Kharat <satishkh@cisco.com>
---
 drivers/net/ethernet/cisco/enic/enic.h      |   9 +
 drivers/net/ethernet/cisco/enic/enic_mbox.c | 490 +++++++++++++++++++++++++++-
 drivers/net/ethernet/cisco/enic/enic_mbox.h |  82 +++++
 3 files changed, 563 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/cisco/enic/enic.h b/drivers/net/ethernet/cisco/enic/enic.h
index 22a0ff71a43c..28b24189d5bf 100644
--- a/drivers/net/ethernet/cisco/enic/enic.h
+++ b/drivers/net/ethernet/cisco/enic/enic.h
@@ -245,6 +245,8 @@ enum enic_admin_chan_state {
 };
 
 /* Per-instance private data structure */
+struct enic_mac_addr;
+
 struct enic {
 	struct net_device *netdev;
 	struct pci_dev *pdev;
@@ -373,6 +375,13 @@ struct enic {
 	unsigned int vf_ack_count;
 	u64 mbox_expected_msg_num;
 	u8 mbox_expected_reply;
+	int mbox_reply_status;
+	u16 mbox_reply_filter_flags;
+	/* The request mutex keeps this caller-owned reply array alive until the
+	 * matching reply handler has copied all per-address result flags.
+	 */
+	struct enic_mac_addr *mbox_reply_mac_addrs;
+	u16 mbox_reply_mac_count;
 	bool mbox_initialized;
 
 	/* PF: per-VF MBOX state, allocated when SRIOV V2 is enabled */
diff --git a/drivers/net/ethernet/cisco/enic/enic_mbox.c b/drivers/net/ethernet/cisco/enic/enic_mbox.c
index 85fed8beb347..2326e00a4fea 100644
--- a/drivers/net/ethernet/cisco/enic/enic_mbox.c
+++ b/drivers/net/ethernet/cisco/enic/enic_mbox.c
@@ -6,6 +6,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/delay.h>
 #include <linux/completion.h>
+#include <linux/etherdevice.h>
 
 #include "vnic_dev.h"
 #include "vnic_wq.h"
@@ -397,6 +398,82 @@ static void enic_mbox_vf_request_finish(struct enic *enic)
 	mutex_unlock(&enic->vf_mbox_request_lock);
 }
 
+/* Return with mbox_state_lock held when this handler owns the reply. */
+static bool enic_mbox_vf_reply_claim(struct enic *enic, u8 reply_type,
+				     u64 msg_num, u8 *expected)
+{
+	spin_lock_bh(&enic->mbox_state_lock);
+	*expected = enic->mbox_expected_reply;
+	if (*expected == reply_type &&
+	    enic->mbox_expected_msg_num == msg_num)
+		return true;
+	spin_unlock_bh(&enic->mbox_state_lock);
+
+	return false;
+}
+
+enum enic_mbox_vf_reply_recovery {
+	ENIC_MBOX_VF_REPLY_OK,
+	ENIC_MBOX_VF_REPLY_RECONNECT,
+	ENIC_MBOX_VF_REPLY_REGISTRATION_LOST,
+};
+
+static int
+enic_mbox_vf_classify_reply(bool malformed, u16 ret_major,
+			    enum enic_mbox_vf_reply_recovery *recovery)
+{
+	*recovery = ENIC_MBOX_VF_REPLY_OK;
+	if (malformed) {
+		*recovery = ENIC_MBOX_VF_REPLY_RECONNECT;
+		return -EIO;
+	}
+	/* Some deployed peers return a negative errno in this 16-bit field.
+	 * Interpret protocol bits only when no unknown bits are present; otherwise
+	 * an errno such as -EINVAL could accidentally look like registration loss.
+	 */
+	if (!(ret_major & ~ENIC_MBOX_ERR_MASK) &&
+	    (ret_major & ENIC_MBOX_ERR_VF_NOT_REGISTERED)) {
+		*recovery = ENIC_MBOX_VF_REPLY_REGISTRATION_LOST;
+		return -ENODEV;
+	}
+	if (!(ret_major & ~ENIC_MBOX_ERR_MASK) &&
+	    (ret_major & ENIC_MBOX_ERR_MSG_NOT_SUPPORTED))
+		return -EOPNOTSUPP;
+	if (ret_major)
+		return -EIO;
+
+	return 0;
+}
+
+static void
+enic_mbox_vf_recover_reply_locked(struct enic *enic,
+				  enum enic_mbox_vf_reply_recovery recovery)
+{
+	bool registration_lost;
+
+	lockdep_assert_held(&enic->mbox_state_lock);
+
+	if (recovery != ENIC_MBOX_VF_REPLY_OK) {
+		registration_lost =
+			recovery == ENIC_MBOX_VF_REPLY_REGISTRATION_LOST;
+		enic_mbox_vf_mark_reconnect_locked(enic, registration_lost);
+	}
+}
+
+static void enic_mbox_vf_reply_complete(struct enic *enic)
+{
+	lockdep_assert_held(&enic->mbox_state_lock);
+	enic->mbox_expected_reply = 0;
+	enic->mbox_expected_msg_num = 0;
+	/* Publish completion before releasing the state lock.  A waiter that
+	 * hit the timeout boundary may otherwise see the claimed state, finish the
+	 * request, and let a new request reinitialize this completion before the
+	 * old handler signals it.
+	 */
+	complete(&enic->mbox_comp);
+	spin_unlock_bh(&enic->mbox_state_lock);
+}
+
 int enic_mbox_send_link_state(struct enic *enic, u16 vf_id, u32 link_state)
 {
 	struct enic_mbox_pf_link_state_notif_msg notif = {};
@@ -572,23 +649,21 @@ static void enic_mbox_vf_handle_reply(struct enic *enic, u8 reply_type,
 				      void *payload, u64 msg_num)
 {
 	struct enic_mbox_generic_reply *reply = payload;
+	enum enic_mbox_vf_reply_recovery recovery;
 	u16 ret_major = le16_to_cpu(reply->ret_major);
-	u64 expected_msg_num;
-	u8 expected_type;
+	u8 expected;
+	int status;
 
-	spin_lock_bh(&enic->mbox_state_lock);
-	expected_type = enic->mbox_expected_reply;
-	expected_msg_num = enic->mbox_expected_msg_num;
-	if (expected_type != reply_type || expected_msg_num != msg_num) {
-		spin_unlock_bh(&enic->mbox_state_lock);
+	status = enic_mbox_vf_classify_reply(false, ret_major, &recovery);
+	if (!enic_mbox_vf_reply_claim(enic, reply_type, msg_num, &expected)) {
 		netdev_warn(enic->netdev,
-			    "MBOX: stale reply %u/%llu (expected %u/%llu), drop\n",
+			    "MBOX: stale reply %u/%llu (expected %u), drop\n",
 			    reply_type, (unsigned long long)msg_num,
-			    expected_type, (unsigned long long)expected_msg_num);
+			    expected);
 		return;
 	}
 
-	if (!ret_major) {
+	if (!status) {
 		switch (reply_type) {
 		case ENIC_MBOX_VF_CAPABILITY_REPLY: {
 			struct enic_mbox_vf_capability_reply_msg *cap = payload;
@@ -605,16 +680,166 @@ static void enic_mbox_vf_handle_reply(struct enic *enic, u8 reply_type,
 			break;
 		}
 	}
-	enic->mbox_expected_reply = 0;
-	enic->mbox_expected_msg_num = 0;
-	complete(&enic->mbox_comp);
-	spin_unlock_bh(&enic->mbox_state_lock);
+	enic_mbox_vf_recover_reply_locked(enic, recovery);
+	WRITE_ONCE(enic->mbox_reply_status, status);
+	enic_mbox_vf_reply_complete(enic);
 
 	if (ret_major)
 		netdev_warn(enic->netdev,
 			    "MBOX: PF rejected reply type %u: %u/%u\n",
 			    reply_type, ret_major,
 			    le16_to_cpu(reply->ret_minor));
+	if (recovery != ENIC_MBOX_VF_REPLY_OK)
+		enic_mbox_vf_kick_recovery(enic);
+}
+
+static bool enic_mbox_vf_mac_reply_matches(const struct enic_mac_addr *request,
+					   const struct enic_mac_addr *reply)
+{
+	u16 request_flags = le16_to_cpu(request->flags);
+	u16 reply_flags = le16_to_cpu(reply->flags);
+	u16 idempotent_result = reply_flags &
+		(ENIC_MAC_ADDR_FLAG_DUPLICATE |
+		 ENIC_MAC_ADDR_FLAG_NOT_FOUND);
+	u16 result = reply_flags & ENIC_MAC_ADDR_FLAG_REPLY_MASK;
+	u16 expected_result;
+
+	if (!ether_addr_equal(request->addr, reply->addr) ||
+	    (request_flags & ENIC_MAC_ADDR_FLAG_REQUEST_MASK) !=
+	    (reply_flags & ENIC_MAC_ADDR_FLAG_REQUEST_MASK))
+		return false;
+	if (hweight16(result) > 1)
+		return false;
+
+	/* DUPLICATE is a successful ADD result and NOT_FOUND is a successful
+	 * DELETE result.  Neither is valid for the opposite operation, and a
+	 * reply cannot report both outcomes for one entry.
+	 */
+	expected_result = request_flags & ENIC_MAC_ADDR_FLAG_ADD ?
+		ENIC_MAC_ADDR_FLAG_DUPLICATE :
+		ENIC_MAC_ADDR_FLAG_NOT_FOUND;
+
+	return !idempotent_result || idempotent_result == expected_result;
+}
+
+static void enic_mbox_vf_handle_add_del_mac_reply(struct enic *enic,
+						  void *payload, u16 msg_len,
+						  u64 msg_num)
+{
+	struct enic_mbox_vf_add_del_mac_reply_msg *reply = payload;
+	enum enic_mbox_vf_reply_recovery recovery;
+	u16 reported_errors = 0;
+	u16 num_addrs = 0;
+	u16 ret_minor = 0;
+	u16 ret_major = 0;
+	u8 expected;
+	unsigned int i;
+	int status;
+
+	if (msg_len < sizeof(*reply)) {
+		status = enic_mbox_vf_classify_reply(true, 0, &recovery);
+	} else {
+		ret_major = le16_to_cpu(reply->reply.ret_major);
+		ret_minor = le16_to_cpu(reply->reply.ret_minor);
+		status = enic_mbox_vf_classify_reply(false, ret_major,
+						     &recovery);
+	}
+	if (status)
+		goto claim;
+
+	num_addrs = le16_to_cpu(reply->num_addrs);
+	if (!num_addrs || num_addrs > ENIC_MBOX_MAX_MAC_OPS ||
+	    struct_size(reply, mac_addr, num_addrs) > msg_len) {
+		status = enic_mbox_vf_classify_reply(true, 0, &recovery);
+		goto claim;
+	}
+
+claim:
+	if (!enic_mbox_vf_reply_claim(enic, ENIC_MBOX_VF_ADD_DEL_MAC_REPLY,
+				      msg_num, &expected))
+		return;
+	if (!status &&
+	    (num_addrs != enic->mbox_reply_mac_count ||
+	     !enic->mbox_reply_mac_addrs)) {
+		status = enic_mbox_vf_classify_reply(true, 0, &recovery);
+	} else if (!status) {
+		/* A detailed reply corresponds entry-for-entry with the request.
+		 * Validate the echoed request fields and operation-specific results
+		 * before exposing result flags to the waiting caller.
+		 */
+		for (i = 0; i < num_addrs; i++) {
+			struct enic_mac_addr *request =
+				&enic->mbox_reply_mac_addrs[i];
+			u16 flags = le16_to_cpu(reply->mac_addr[i].flags);
+
+			if (!enic_mbox_vf_mac_reply_matches(request,
+							    &reply->mac_addr[i])) {
+				status = enic_mbox_vf_classify_reply(true, 0,
+								     &recovery);
+				break;
+			}
+			if (flags & ENIC_MAC_ADDR_FLAG_INDETERMINATE_MASK) {
+				status = -EIO;
+				recovery = ENIC_MBOX_VF_REPLY_RECONNECT;
+				break;
+			}
+			if ((flags & ENIC_MAC_ADDR_FLAG_REPLY_MASK) &&
+			    !(flags & ENIC_MAC_ADDR_FLAG_SKIPPED))
+				reported_errors++;
+		}
+		if (!status && reported_errors != ret_minor)
+			status = enic_mbox_vf_classify_reply(true, 0,
+							     &recovery);
+
+		if (!status)
+			for (i = 0; i < num_addrs; i++)
+				enic->mbox_reply_mac_addrs[i].flags =
+					reply->mac_addr[i].flags;
+	}
+	/* After a malformed reply, the VF cannot trust that its state matches the
+	 * PF. VF_NOT_REGISTERED means the PF removed all VF state. Both require a
+	 * new registration; an ordinary policy rejection does not.
+	 */
+	enic_mbox_vf_recover_reply_locked(enic, recovery);
+	WRITE_ONCE(enic->mbox_reply_status, status);
+	enic_mbox_vf_reply_complete(enic);
+	if (recovery != ENIC_MBOX_VF_REPLY_OK)
+		enic_mbox_vf_kick_recovery(enic);
+}
+
+static void enic_mbox_vf_handle_set_pkt_filter_reply(struct enic *enic,
+						     void *payload, u16 msg_len,
+						     u64 msg_num)
+{
+	struct enic_mbox_vf_set_pkt_filter_reply_msg *reply = payload;
+	enum enic_mbox_vf_reply_recovery recovery;
+	u16 applied = 0;
+	u16 ret_major = 0;
+	u8 expected;
+	int status;
+
+	if (msg_len < sizeof(*reply)) {
+		status = enic_mbox_vf_classify_reply(true, 0, &recovery);
+	} else {
+		ret_major = le16_to_cpu(reply->reply.ret_major);
+		status = enic_mbox_vf_classify_reply(false, ret_major,
+						     &recovery);
+		if (status && (ret_major & ~ENIC_MBOX_ERR_MASK))
+			recovery = ENIC_MBOX_VF_REPLY_RECONNECT;
+	}
+	if (!status)
+		applied = le16_to_cpu(reply->reply.ret_minor);
+
+	if (!enic_mbox_vf_reply_claim(enic,
+				      ENIC_MBOX_VF_SET_PKT_FILTER_REPLY,
+				      msg_num, &expected))
+		return;
+	enic_mbox_vf_recover_reply_locked(enic, recovery);
+	WRITE_ONCE(enic->mbox_reply_status, status);
+	WRITE_ONCE(enic->mbox_reply_filter_flags, applied);
+	enic_mbox_vf_reply_complete(enic);
+	if (recovery != ENIC_MBOX_VF_REPLY_OK)
+		enic_mbox_vf_kick_recovery(enic);
 }
 
 static void enic_mbox_vf_handle_link_state(struct enic *enic, void *payload,
@@ -700,6 +925,34 @@ static bool enic_mbox_vf_payload_ok(struct enic *enic, u8 msg_type,
 	return true;
 }
 
+static void enic_mbox_vf_malformed_msg(struct enic *enic, u8 msg_type,
+				       u64 msg_num)
+{
+	u8 expected;
+
+	switch (msg_type) {
+	case ENIC_MBOX_PF_LINK_STATE_NOTIF:
+	case ENIC_MBOX_PF_SET_ADMIN_MAC_NOTIF:
+		enic_mbox_vf_require_reconnect(enic);
+		return;
+	case ENIC_MBOX_VF_CAPABILITY_REPLY:
+	case ENIC_MBOX_VF_REGISTER_REPLY:
+	case ENIC_MBOX_VF_UNREGISTER_REPLY:
+	case ENIC_MBOX_VF_ADD_DEL_MAC_REPLY:
+	case ENIC_MBOX_VF_SET_PKT_FILTER_REPLY:
+		break;
+	default:
+		return;
+	}
+
+	if (!enic_mbox_vf_reply_claim(enic, msg_type, msg_num, &expected))
+		return;
+	enic_mbox_vf_mark_reconnect_locked(enic, false);
+	WRITE_ONCE(enic->mbox_reply_status, -EIO);
+	enic_mbox_vf_reply_complete(enic);
+	enic_mbox_vf_kick_recovery(enic);
+}
+
 static void enic_mbox_vf_process_msg(struct enic *enic,
 				     struct enic_mbox_hdr *hdr, void *payload,
 				     u16 payload_len)
@@ -711,8 +964,10 @@ static void enic_mbox_vf_process_msg(struct enic *enic,
 		size_t exp = sizeof(struct enic_mbox_vf_capability_reply_msg);
 
 		if (!enic_mbox_vf_payload_ok(enic, hdr->msg_type,
-					     payload_len, exp))
+					     payload_len, exp)) {
+			enic_mbox_vf_malformed_msg(enic, hdr->msg_type, msg_num);
 			return;
+		}
 		enic_mbox_vf_handle_reply(enic, hdr->msg_type, payload, msg_num);
 		break;
 	}
@@ -720,8 +975,10 @@ static void enic_mbox_vf_process_msg(struct enic *enic,
 		size_t exp = sizeof(struct enic_mbox_vf_register_reply_msg);
 
 		if (!enic_mbox_vf_payload_ok(enic, hdr->msg_type,
-					     payload_len, exp))
+					     payload_len, exp)) {
+			enic_mbox_vf_malformed_msg(enic, hdr->msg_type, msg_num);
 			return;
+		}
 		enic_mbox_vf_handle_reply(enic, hdr->msg_type, payload, msg_num);
 		break;
 	}
@@ -729,8 +986,10 @@ static void enic_mbox_vf_process_msg(struct enic *enic,
 		size_t exp = sizeof(struct enic_mbox_vf_register_reply_msg);
 
 		if (!enic_mbox_vf_payload_ok(enic, hdr->msg_type,
-					     payload_len, exp))
+					     payload_len, exp)) {
+			enic_mbox_vf_malformed_msg(enic, hdr->msg_type, msg_num);
 			return;
+		}
 		enic_mbox_vf_handle_reply(enic, hdr->msg_type, payload, msg_num);
 		break;
 	}
@@ -738,11 +997,21 @@ static void enic_mbox_vf_process_msg(struct enic *enic,
 		size_t exp = sizeof(struct enic_mbox_pf_link_state_notif_msg);
 
 		if (!enic_mbox_vf_payload_ok(enic, hdr->msg_type,
-					     payload_len, exp))
+					     payload_len, exp)) {
+			enic_mbox_vf_malformed_msg(enic, hdr->msg_type, msg_num);
 			return;
+		}
 		enic_mbox_vf_handle_link_state(enic, payload, msg_num);
 		break;
 	}
+	case ENIC_MBOX_VF_ADD_DEL_MAC_REPLY:
+		enic_mbox_vf_handle_add_del_mac_reply(enic, payload,
+						      payload_len, msg_num);
+		break;
+	case ENIC_MBOX_VF_SET_PKT_FILTER_REPLY:
+		enic_mbox_vf_handle_set_pkt_filter_reply(enic, payload,
+							 payload_len, msg_num);
+		break;
 	default:
 		netdev_dbg(enic->netdev,
 			   "MBOX: VF unhandled msg type %u\n",
@@ -782,6 +1051,10 @@ static void enic_mbox_recv_handler(struct enic *enic, void *buf,
 			netdev_warn(enic->netdev,
 				    "MBOX: invalid msg_len %u (buf len %u)\n",
 				    msg_len, len);
+		if (!enic->vf_state &&
+		    le16_to_cpu(hdr->src_vnic_id) == ENIC_MBOX_DST_PF)
+			enic_mbox_vf_malformed_msg(enic, hdr->msg_type,
+						   le64_to_cpu(hdr->msg_num));
 		return;
 	}
 
@@ -812,10 +1085,12 @@ int enic_mbox_vf_capability_check(struct enic *enic)
 {
 	struct enic_mbox_vf_capability_msg req = {};
 	u32 version;
+	int status;
 	int err;
 
 	enic_mbox_vf_request_start(enic);
 	WRITE_ONCE(enic->pf_cap_version, 0);
+	WRITE_ONCE(enic->mbox_reply_status, 0);
 	req.version = cpu_to_le32(ENIC_MBOX_CAP_VERSION_1);
 
 	err = enic_mbox_vf_send_request(enic,
@@ -829,12 +1104,15 @@ int enic_mbox_vf_capability_check(struct enic *enic)
 
 	err = enic_mbox_wait_reply(enic, 3000);
 	version = READ_ONCE(enic->pf_cap_version);
+	status = READ_ONCE(enic->mbox_reply_status);
 	enic_mbox_vf_request_finish(enic);
 	if (err) {
 		netdev_warn(enic->netdev,
 			    "MBOX: no capability reply from PF\n");
 		return err;
 	}
+	if (status)
+		return status;
 
 	if (version < ENIC_MBOX_CAP_VERSION_1) {
 		netdev_warn(enic->netdev,
@@ -849,10 +1127,12 @@ int enic_mbox_vf_capability_check(struct enic *enic)
 int enic_mbox_vf_register(struct enic *enic)
 {
 	bool registered;
+	int status;
 	int err;
 
 	enic_mbox_vf_request_start(enic);
 	WRITE_ONCE(enic->vf_registered, false);
+	WRITE_ONCE(enic->mbox_reply_status, 0);
 
 	err = enic_mbox_vf_send_request(enic, ENIC_MBOX_VF_REGISTER_REQUEST,
 					ENIC_MBOX_VF_REGISTER_REPLY, NULL, 0);
@@ -863,12 +1143,15 @@ int enic_mbox_vf_register(struct enic *enic)
 
 	err = enic_mbox_wait_reply(enic, 3000);
 	registered = READ_ONCE(enic->vf_registered);
+	status = READ_ONCE(enic->mbox_reply_status);
 	enic_mbox_vf_request_finish(enic);
 	if (err) {
 		netdev_warn(enic->netdev,
 			    "MBOX: VF registration with PF timed out\n");
 		return err;
 	}
+	if (status)
+		return status;
 
 	if (!registered)
 		return -ENODEV;
@@ -879,15 +1162,18 @@ int enic_mbox_vf_register(struct enic *enic)
 int enic_mbox_vf_unregister(struct enic *enic)
 {
 	bool registered;
+	int status;
 	int err;
 
 	if (!READ_ONCE(enic->vf_registered))
 		return 0;
+
 	enic_mbox_vf_request_start(enic);
 	if (!READ_ONCE(enic->vf_registered)) {
 		enic_mbox_vf_request_finish(enic);
 		return 0;
 	}
+	WRITE_ONCE(enic->mbox_reply_status, 0);
 
 	err = enic_mbox_vf_send_request(enic,
 					ENIC_MBOX_VF_UNREGISTER_REQUEST,
@@ -900,14 +1186,182 @@ int enic_mbox_vf_unregister(struct enic *enic)
 
 	err = enic_mbox_wait_reply(enic, 3000);
 	registered = READ_ONCE(enic->vf_registered);
+	status = READ_ONCE(enic->mbox_reply_status);
 	enic_mbox_vf_request_finish(enic);
 	if (err)
 		return err;
+	if (status)
+		return status;
 	if (registered)
 		return -EACCES;
 	return 0;
 }
 
+int enic_mbox_vf_add_del_macs(struct enic *enic,
+			      struct enic_mac_addr *macs, u16 num_macs)
+{
+	struct enic_mbox_vf_add_del_mac_msg *req;
+	unsigned int i;
+	int status;
+	int err;
+
+	if (!READ_ONCE(enic->vf_registered) || !enic->has_admin_channel)
+		return -ENODEV;
+	if (!num_macs || num_macs > ENIC_MBOX_MAX_MAC_OPS)
+		return -EINVAL;
+
+	req = kzalloc_flex(*req, mac_addr, num_macs);
+	if (!req)
+		return -ENOMEM;
+
+	req->num_addrs = cpu_to_le16(num_macs);
+	for (i = 0; i < num_macs; i++)
+		req->mac_addr[i] = macs[i];
+
+	enic_mbox_vf_request_start(enic);
+	if (!READ_ONCE(enic->vf_registered) || !enic->has_admin_channel) {
+		err = -ENODEV;
+	} else {
+		spin_lock_bh(&enic->mbox_state_lock);
+		enic->mbox_reply_mac_addrs = macs;
+		enic->mbox_reply_mac_count = num_macs;
+		spin_unlock_bh(&enic->mbox_state_lock);
+		WRITE_ONCE(enic->mbox_reply_status, 0);
+		err = enic_mbox_vf_send_request(enic,
+						ENIC_MBOX_VF_ADD_DEL_MAC_REQUEST,
+						ENIC_MBOX_VF_ADD_DEL_MAC_REPLY,
+						req,
+						struct_size(req, mac_addr,
+							    num_macs));
+	}
+	kfree(req);
+	if (err) {
+		spin_lock_bh(&enic->mbox_state_lock);
+		enic->mbox_reply_mac_addrs = NULL;
+		enic->mbox_reply_mac_count = 0;
+		spin_unlock_bh(&enic->mbox_state_lock);
+		enic_mbox_vf_request_abort(enic);
+		return err;
+	}
+
+	err = enic_mbox_wait_reply(enic, 3000);
+	status = READ_ONCE(enic->mbox_reply_status);
+	spin_lock_bh(&enic->mbox_state_lock);
+	enic->mbox_reply_mac_addrs = NULL;
+	enic->mbox_reply_mac_count = 0;
+	spin_unlock_bh(&enic->mbox_state_lock);
+	if (err) {
+		/* The PF may have updated its software ledger before a hardware
+		 * failure whose reply was lost. A repeated idempotent operation could
+		 * then appear converged while hardware state is stale, so replay from
+		 * a fresh registration generation.
+		 */
+		enic_mbox_vf_require_reconnect(enic);
+		enic_mbox_vf_request_finish(enic);
+		return err;
+	}
+	enic_mbox_vf_request_finish(enic);
+
+	return status;
+}
+
+int enic_mbox_vf_add_del_mac(struct enic *enic, const u8 *addr, bool add,
+			     bool station)
+{
+	struct enic_mac_addr mac = {};
+	u16 flags = 0;
+	int err;
+
+	ether_addr_copy(mac.addr, addr);
+	if (add)
+		flags |= ENIC_MAC_ADDR_FLAG_ADD;
+	if (station)
+		flags |= ENIC_MAC_ADDR_FLAG_STATION;
+	mac.flags = cpu_to_le16(flags);
+
+	err = enic_mbox_vf_add_del_macs(enic, &mac, 1);
+	if (err)
+		return err;
+	if (le16_to_cpu(mac.flags) & ENIC_MAC_ADDR_FLAG_ERROR_MASK)
+		return -EACCES;
+
+	return 0;
+}
+
+int enic_mbox_vf_set_pkt_filter(struct enic *enic, int directed,
+				int multicast, int broadcast,
+				int promisc, int allmulti, u16 *applied_flags)
+{
+	struct enic_mbox_vf_set_pkt_filter_msg req = {};
+	u16 applied;
+	u16 flags = 0;
+	u16 required;
+	int status;
+	int err;
+
+	if (!READ_ONCE(enic->vf_registered) || !enic->has_admin_channel)
+		return -ENODEV;
+
+	if (directed)
+		flags |= CMD_PFILTER_DIRECTED;
+	if (multicast)
+		flags |= CMD_PFILTER_MULTICAST;
+	if (broadcast)
+		flags |= CMD_PFILTER_BROADCAST;
+	if (promisc)
+		flags |= CMD_PFILTER_PROMISCUOUS;
+	if (allmulti)
+		flags |= CMD_PFILTER_ALL_MULTICAST;
+	req.flags = cpu_to_le16(flags);
+
+	enic_mbox_vf_request_start(enic);
+	if (!READ_ONCE(enic->vf_registered) || !enic->has_admin_channel) {
+		enic_mbox_vf_request_abort(enic);
+		return -ENODEV;
+	}
+	WRITE_ONCE(enic->mbox_reply_status, 0);
+	WRITE_ONCE(enic->mbox_reply_filter_flags, 0);
+
+	err = enic_mbox_vf_send_request(enic,
+					ENIC_MBOX_VF_SET_PKT_FILTER_REQUEST,
+					ENIC_MBOX_VF_SET_PKT_FILTER_REPLY,
+					&req, sizeof(req));
+	if (err) {
+		enic_mbox_vf_request_abort(enic);
+		return err;
+	}
+
+	err = enic_mbox_wait_reply(enic, 3000);
+	status = READ_ONCE(enic->mbox_reply_status);
+	if (!err && !status) {
+		applied = READ_ONCE(enic->mbox_reply_filter_flags);
+		/* Directed, multicast, and broadcast are not policy-gated.  The PF
+		 * may only withhold the two broad receive modes, and may add directed
+		 * reception because it is mandatory for a usable VF.
+		 */
+		required = (flags | CMD_PFILTER_DIRECTED) &
+			   ~(CMD_PFILTER_PROMISCUOUS |
+			     CMD_PFILTER_ALL_MULTICAST);
+		if ((applied & ~(flags | CMD_PFILTER_DIRECTED)) ||
+		    (applied & required) != required) {
+			netdev_warn(enic->netdev,
+				    "MBOX: invalid packet filter reply %#x for request %#x\n",
+				    applied, flags);
+			enic_mbox_vf_require_reconnect(enic);
+			status = -EIO;
+		} else if (applied_flags) {
+			*applied_flags = applied;
+		}
+	}
+	if (err)
+		enic_mbox_vf_require_reconnect(enic);
+	enic_mbox_vf_request_finish(enic);
+	if (err)
+		return err;
+
+	return status;
+}
+
 void enic_mbox_init(struct enic *enic)
 {
 	bool reinit = enic->mbox_initialized;
diff --git a/drivers/net/ethernet/cisco/enic/enic_mbox.h b/drivers/net/ethernet/cisco/enic/enic_mbox.h
index 37bc41a900f4..5eca3a25671e 100644
--- a/drivers/net/ethernet/cisco/enic/enic_mbox.h
+++ b/drivers/net/ethernet/cisco/enic/enic_mbox.h
@@ -5,6 +5,7 @@
 #define _ENIC_MBOX_H_
 
 #include <linux/bits.h>
+#include <linux/if_ether.h>
 #include <linux/types.h>
 
 /*
@@ -22,6 +23,12 @@ enum enic_mbox_msg_type {
 	ENIC_MBOX_VF_UNREGISTER_REPLY		= 5,
 	ENIC_MBOX_PF_LINK_STATE_NOTIF		= 6,
 	ENIC_MBOX_PF_LINK_STATE_ACK		= 7,
+	ENIC_MBOX_VF_ADD_DEL_MAC_REQUEST	= 10,
+	ENIC_MBOX_VF_ADD_DEL_MAC_REPLY		= 11,
+	ENIC_MBOX_PF_SET_ADMIN_MAC_NOTIF	= 12,
+	ENIC_MBOX_PF_SET_ADMIN_MAC_ACK		= 13,
+	ENIC_MBOX_VF_SET_PKT_FILTER_REQUEST	= 14,
+	ENIC_MBOX_VF_SET_PKT_FILTER_REPLY	= 15,
 	ENIC_MBOX_MAX
 };
 
@@ -42,6 +49,9 @@ struct enic_mbox_generic_reply {
 #define ENIC_MBOX_ERR_GENERIC		BIT(0)
 #define ENIC_MBOX_ERR_VF_NOT_REGISTERED	BIT(1)
 #define ENIC_MBOX_ERR_MSG_NOT_SUPPORTED	BIT(2)
+#define ENIC_MBOX_ERR_MASK		(ENIC_MBOX_ERR_GENERIC | \
+					 ENIC_MBOX_ERR_VF_NOT_REGISTERED | \
+					 ENIC_MBOX_ERR_MSG_NOT_SUPPORTED)
 
 /* ENIC_MBOX_VF_CAPABILITY_REQUEST / _REPLY */
 #define ENIC_MBOX_CAP_VERSION_0		0
@@ -80,6 +90,71 @@ struct enic_mbox_pf_link_state_ack_msg {
 	struct enic_mbox_generic_reply ack;
 };
 
+/* ENIC_MBOX_PF_SET_ADMIN_MAC_NOTIF / _ACK */
+struct enic_mbox_pf_set_admin_mac_notif_msg {
+	u8 mac_addr[ETH_ALEN];
+	__le16 pad;
+};
+
+/* ENIC_MBOX_VF_ADD_DEL_MAC_REQUEST / _REPLY */
+#define ENIC_MAC_ADDR_FLAG_ADD		BIT(0)
+#define ENIC_MAC_ADDR_FLAG_STATION	BIT(1)
+#define ENIC_MAC_ADDR_FLAG_OVERFLOW	BIT(8)
+#define ENIC_MAC_ADDR_FLAG_DUPLICATE	BIT(9)
+#define ENIC_MAC_ADDR_FLAG_FAILED	BIT(10)
+#define ENIC_MAC_ADDR_FLAG_NOT_FOUND	BIT(11)
+#define ENIC_MAC_ADDR_FLAG_ERROR	BIT(12)
+#define ENIC_MAC_ADDR_FLAG_NOT_PERMITTED BIT(13)
+#define ENIC_MAC_ADDR_FLAG_INVALID	BIT(14)
+#define ENIC_MAC_ADDR_FLAG_SKIPPED	BIT(15)
+
+#define ENIC_MAC_ADDR_FLAG_REQUEST_MASK	GENMASK(7, 0)
+#define ENIC_MAC_ADDR_FLAG_REPLY_MASK	GENMASK(15, 8)
+#define ENIC_MAC_ADDR_FLAG_INDETERMINATE_MASK \
+	(ENIC_MAC_ADDR_FLAG_FAILED | ENIC_MAC_ADDR_FLAG_ERROR)
+#define ENIC_MAC_ADDR_FLAG_PERMANENT_MASK \
+	(ENIC_MAC_ADDR_FLAG_OVERFLOW | ENIC_MAC_ADDR_FLAG_NOT_PERMITTED | \
+	 ENIC_MAC_ADDR_FLAG_INVALID)
+#define ENIC_MAC_ADDR_FLAG_ERROR_MASK	(ENIC_MAC_ADDR_FLAG_OVERFLOW | \
+					 ENIC_MAC_ADDR_FLAG_FAILED | \
+					 ENIC_MAC_ADDR_FLAG_ERROR | \
+					 ENIC_MAC_ADDR_FLAG_NOT_PERMITTED | \
+					 ENIC_MAC_ADDR_FLAG_INVALID | \
+					 ENIC_MAC_ADDR_FLAG_SKIPPED)
+
+/* The protocol permits replacing all perfect filters and the station address
+ * in one request: one delete and one add operation for each address.
+ */
+#define ENIC_MBOX_MAX_MAC_OPS		130
+
+struct enic_mac_addr {
+	u8 addr[ETH_ALEN];
+	__le16 flags;
+};
+
+struct enic_mbox_vf_add_del_mac_msg {
+	__le16 num_addrs;
+	__le16 pad;
+	struct enic_mac_addr mac_addr[];
+};
+
+struct enic_mbox_vf_add_del_mac_reply_msg {
+	struct enic_mbox_generic_reply reply;
+	__le16 num_addrs;
+	__le16 pad;
+	struct enic_mac_addr mac_addr[];
+};
+
+/* ENIC_MBOX_VF_SET_PKT_FILTER_REQUEST / _REPLY */
+struct enic_mbox_vf_set_pkt_filter_msg {
+	__le16 flags;
+	__le16 pad;
+};
+
+struct enic_mbox_vf_set_pkt_filter_reply_msg {
+	struct enic_mbox_generic_reply reply;
+};
+
 #define ENIC_MBOX_DST_PF	0xFFFF
 
 struct enic;
@@ -95,5 +170,12 @@ void enic_mbox_vf_require_reconnect(struct enic *enic);
 int enic_mbox_vf_capability_check(struct enic *enic);
 int enic_mbox_vf_register(struct enic *enic);
 int enic_mbox_vf_unregister(struct enic *enic);
+int enic_mbox_vf_add_del_macs(struct enic *enic,
+			      struct enic_mac_addr *macs, u16 num_macs);
+int enic_mbox_vf_add_del_mac(struct enic *enic, const u8 *addr, bool add,
+			     bool station);
+int enic_mbox_vf_set_pkt_filter(struct enic *enic, int directed, int multicast,
+				int broadcast, int promisc, int allmulti,
+				u16 *applied_flags);
 
 #endif /* _ENIC_MBOX_H_ */

-- 
2.43.0

