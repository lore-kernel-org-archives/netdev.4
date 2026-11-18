Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044764;
	b=0aw+WJia958ftc1AETEraWsxTVjdWvF/g9qOIZQTqdiKinLndUcLVP8661WAh0LGG7xs
	 jsyjPU8FP1Gc+kskvcZmHQsIxqXuw5Kf0An5D/wZtrYF/17154JFrhYFZG0ScZJH8exyC
	 eswueSzuMv1q5Hgj0ecfcrLHxcPJ0RQ05TTnr6TATc9Wd0AKwr0rasn/88Ry7L5bY/aRq
	 YYd/CncfIgIRlx7riQX/r9lr+tYkQV7r1Wq8qbbn3aT2gXBGsL9z+uSaF1qtFSHyEIZ/m
	 HkP8a9JID+7lV3HFO/cV5LOs7I2jdNwhYvmwcouWoK1tqOV9MSIzFWIdZhcznL10Q/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044764;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Outbound-Client-TLS:
	 X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=u1SsReMF5grGrYKcW10Y/ud0duv/TSaP+p538EWQjeA=;
	b=i9KMNYTfYI5JVQad5YT+/O484rUDjQuo/oB4As6g79+zqppF9Yew0pzzR4Jr93IBtQ7z
	 aYkdTbhCONBd9iy40Rt3Vv3J7Mgp5B1Go5cJ8KZ2xR6FjNcB3PxyYTZ01e6ob9Tv/tkUM
	 hVjB6hx8XauPMR9c8paXh2wwW2KQmhiff8xCXJSlFsybpZV58ZpXY8Dpwr0d0jHa/vvV7
	 JbxWveqEL87jawGbT2bCLBjxZT/hq0PIyqUiIOdDQ+ptSnNgXvCupKnngsvQ8ayKnBkfb
	 CwnR3gpC+DBOadeHIzbtExmLNqPIhEjYaqHDdO06TqHVJ94c9GaUuMIwjCQniL8Y7MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=kV3SLB0u;
	arc=none smtp.remote-ip=173.37.86.72
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6C060A5BDC;
	Wed, 18 Nov 2026 23:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6C060A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=kV3SLB0u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4856; q=dns/txt;
  s=iport01; t=1795044763; x=1796254363;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=u1SsReMF5grGrYKcW10Y/ud0duv/TSaP+p538EWQjeA=;
  b=kV3SLB0u6wcfbxfMMMdlyJBNoHL6hLLiz4uQ7Q/Bl13IRJl7Vw9SSYai
   szcbiEPKSEiQmGpx/9Mx6qZSDcHAhfe0uYdKZ5WvSK85pRS6ExIl2r521
   AMXM/eDaoYElAsjA8rEcqhGmvt2GZE3/sU0eoPuFw74u1JFyoNavXXpxO
   QgH8ZU07teermfi6Dax5Zy82w73NttBCFIwZLm4BI+GA+J1mTgMzOtLHR
   djyXkRRVQWsncWHDNvgT/2qhDGhGSxzxGDGYFnK92iNArXnS4COdAc9PS
   MozqI04I0HiWw57VtqGygK/+007yG7hQAvAeUnq2HYe/BBEdtt72Sakvr
   Q==;
X-CSE-ConnectionGUID: pcdSTMeuRnSE31yr8VxFMg==
X-CSE-MsgGUID: FxVK4bt3R8Gze5oJW+pZXQ==
X-IPAS-Result: =?us-ascii?q?A0AaAABDNP5q/5L/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglaBVUNJhFeIG4c4giGeK4F+DwEBAQ9RBAEBhQUCjiACJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4ThlyQEwIBAyMEUhAlAiYCA?=
 =?us-ascii?q?kUBEAYBEoMCgnUDuV16fzOBAYR+2UuBaAELFAGBCi4BhXOCbgGBcYQIO4RCJ?=
 =?us-ascii?q?xuBSUSBFYNqgQUBgxmEAIJqBIIiehKYPwk/gQIcA1ksAVUTDQoLBwVjUjMDI?=
 =?us-ascii?q?AoLEhIYFQIUHRIPBBYyHXAMJxIpFy9YGwYFgRxzFAQTgRKBA12BKyhdASGBC?=
 =?us-ascii?q?IF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcIAxoFQ?=
 =?us-ascii?q?AIfCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAgoYDUgRLBQjBg8ZBD0BbgeTS?=
 =?us-ascii?q?4MYgQQLJSZhAYEAMJcnjV5roRGEK4FooBAzl2qTCJkII6NoUIRqgWg8gVkzG?=
 =?us-ascii?q?ggbFYMiUxkPji4LC5MdAb0AJjI9AQEHAgcOAwuBaJARgW0BAQ?=
IronPort-Data: A9a23:+rx+yqDHXJC2shVW//viw5YqxClBgxIJ4kV8jS/XYbTApDgn0TAGn
 DYbXm6PbKmNMGv0LYxxYIS0/ElS7JbSyNBqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8i2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2/5iN30TMJAi/N1aWjhf7
 6wmOB4oYUXW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/E5sinfyohXnXeDxDo1XTrq0yi4TW5FEtgOiyaYOPILRmQ+17jni7+
 mjapF6pLQMXadu99nmdwEKV07qncSTTHdh6+KeD3vJjnlCW7mAaFhATUVy1vb+/h1LWc99TN
 kkd6Ccyhas/7kqmSp/6RRLQiH6DpBsHc9ldCes37EeK0KW8ywWEDGEsTTNbbtEi8sgsSlQC3
 1mFhd72RjpirLGYV1qZ67GS6ziyUQANJGUPYy4sVwYJ49D/5oo0i3rnStdlDb7wjdDvHzz06
 y6FoTJ4hLgJi8MPkaKh8jjvhT+wqpXXZhA66x+RXW+/6A59Iom/aOSVBUPz9/1MKsOdC1KGp
 nVBw5nY5+EVBpbLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:OV+OIK0+QuK/mJYfoEVf7wqjBGMkLtp133Aq2lEZdPU1SL38qy
 nKppkmPHDP5Ar5NEtOpTn4AtjnfZqEz+8T3WBzB8bBYOCFgguVxehZhOOJ/9SHIUPDH4VmpM
 RdmsZFaeEYOmIK6frS0U2bD9In+9WJmZrCuQ4H9QYRceixUdAa0+6lMHfjLqSrfng9OXPmLu
 vh2iIpzwDQAUgqUg==
X-Talos-CUID: =?us-ascii?q?9a23=3AKX7Ismoag957vyH9Otfi8u/mUdgufkbh6XrNGUm?=
 =?us-ascii?q?DJD0wWafFd0++3awxxg=3D=3D?=
X-Talos-MUID: 9a23:KkZItAQu7dIHIZHMRXTClA9BaM10uJ7+J1IAzJIkhIqcBxxJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="548871122"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 23:32:42 +0000
Received: from [127.0.0.1] (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id A39E11800058D;
	Wed, 18 Nov 2026 23:32:41 +0000 (GMT)
From: Satish Kharat <satishkh@cisco.com>
Date: Wed, 18 Nov 2026 15:32:28 -0800
Subject: [PATCH net-next v3 2/6] enic: serialize V2 VF mailbox requests
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
Message-Id: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-2-2cb25677aa8c@cisco.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044758; l=4983;
 i=satishkh@cisco.com; h=from:subject:message-id;
 bh=Bhh39nQ+XKPYFCjwldn/uaiiPhrPCpAKC/twJCjBrg0=;
 b=EllvTNJjhXSP+phcHscJoPEk/yVopBjJdyJAH4WE3pd15m9sUauNJn+u75Ti13ysMx1xecoIa
 SEcVxI2LhNDAwayuNGPzq5rO1ItQ1gn9n5KHY7VZDrptSPpKdQtTrYh
X-Developer-Key: i=satishkh@cisco.com; a=ed25519;
 pk=4BxbLoCGvHeIMH/PbpiNVx8/2IcTjFvqcr0AD8K6WLY=
X-Outbound-Client-TLS: ANONYMOUS;unknown [10.25.129.52];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.25.129.52, [10.25.129.52]
X-Outbound-Node: rcdn-l-core-09.cisco.com

The VF stores one expected reply and uses one completion for mailbox
requests. If two VF control paths issue requests at the same time, the
second request can replace the reply state for the first.

Add a request mutex used only by the VF. Hold it from before a request is
armed until its reply or timeout has been consumed. Recheck VF registration
after taking the mutex and clear pending state on send failure so a later
request cannot inherit it.

PF-side request processing is unchanged. Unsolicited PF notifications and
their acknowledgments remain asynchronous.

Assisted-by: LLM

Signed-off-by: Satish Kharat <satishkh@cisco.com>
---
 drivers/net/ethernet/cisco/enic/enic.h      |  1 +
 drivers/net/ethernet/cisco/enic/enic_mbox.c | 49 +++++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cisco/enic/enic.h b/drivers/net/ethernet/cisco/enic/enic.h
index a4f9f58c1adf..15f17019c076 100644
--- a/drivers/net/ethernet/cisco/enic/enic.h
+++ b/drivers/net/ethernet/cisco/enic/enic.h
@@ -344,6 +344,7 @@ struct enic {
 	 * the requester.
 	 */
 	struct completion mbox_comp;
+	struct mutex vf_mbox_request_lock; /* serializes VF request lifetimes */
 	spinlock_t mbox_state_lock;	/* protects expected reply state */
 	u64 mbox_expected_msg_num;
 	u8 mbox_expected_reply;
diff --git a/drivers/net/ethernet/cisco/enic/enic_mbox.c b/drivers/net/ethernet/cisco/enic/enic_mbox.c
index a1f8138d0bbd..d1b6f13c8002 100644
--- a/drivers/net/ethernet/cisco/enic/enic_mbox.c
+++ b/drivers/net/ethernet/cisco/enic/enic_mbox.c
@@ -226,6 +226,32 @@ static int enic_mbox_wait_reply(struct enic *enic, unsigned long timeout_ms)
 	return err;
 }
 
+static void enic_mbox_vf_request_start(struct enic *enic)
+{
+	mutex_lock(&enic->vf_mbox_request_lock);
+	reinit_completion(&enic->mbox_comp);
+	spin_lock_bh(&enic->mbox_state_lock);
+	enic->mbox_expected_msg_num = 0;
+	enic->mbox_expected_reply = 0;
+	spin_unlock_bh(&enic->mbox_state_lock);
+}
+
+static void enic_mbox_vf_request_abort(struct enic *enic)
+{
+	lockdep_assert_held(&enic->vf_mbox_request_lock);
+	spin_lock_bh(&enic->mbox_state_lock);
+	enic->mbox_expected_reply = 0;
+	enic->mbox_expected_msg_num = 0;
+	spin_unlock_bh(&enic->mbox_state_lock);
+	mutex_unlock(&enic->vf_mbox_request_lock);
+}
+
+static void enic_mbox_vf_request_finish(struct enic *enic)
+{
+	lockdep_assert_held(&enic->vf_mbox_request_lock);
+	mutex_unlock(&enic->vf_mbox_request_lock);
+}
+
 int enic_mbox_send_link_state(struct enic *enic, u16 vf_id, u32 link_state)
 {
 	struct enic_mbox_pf_link_state_notif_msg notif = {};
@@ -631,6 +657,7 @@ int enic_mbox_vf_capability_check(struct enic *enic)
 	u32 version;
 	int err;
 
+	enic_mbox_vf_request_start(enic);
 	WRITE_ONCE(enic->pf_cap_version, 0);
 	req.version = cpu_to_le32(ENIC_MBOX_CAP_VERSION_1);
 
@@ -638,11 +665,14 @@ int enic_mbox_vf_capability_check(struct enic *enic)
 					ENIC_MBOX_VF_CAPABILITY_REQUEST,
 					ENIC_MBOX_VF_CAPABILITY_REPLY,
 					&req, sizeof(req));
-	if (err)
+	if (err) {
+		enic_mbox_vf_request_abort(enic);
 		return err;
+	}
 
 	err = enic_mbox_wait_reply(enic, 3000);
 	version = READ_ONCE(enic->pf_cap_version);
+	enic_mbox_vf_request_finish(enic);
 	if (err) {
 		netdev_warn(enic->netdev,
 			    "MBOX: no capability reply from PF\n");
@@ -664,15 +694,19 @@ int enic_mbox_vf_register(struct enic *enic)
 	bool registered;
 	int err;
 
+	enic_mbox_vf_request_start(enic);
 	WRITE_ONCE(enic->vf_registered, false);
 
 	err = enic_mbox_vf_send_request(enic, ENIC_MBOX_VF_REGISTER_REQUEST,
 					ENIC_MBOX_VF_REGISTER_REPLY, NULL, 0);
-	if (err)
+	if (err) {
+		enic_mbox_vf_request_abort(enic);
 		return err;
+	}
 
 	err = enic_mbox_wait_reply(enic, 3000);
 	registered = READ_ONCE(enic->vf_registered);
+	enic_mbox_vf_request_finish(enic);
 	if (err) {
 		netdev_warn(enic->netdev,
 			    "MBOX: VF registration with PF timed out\n");
@@ -692,16 +726,24 @@ int enic_mbox_vf_unregister(struct enic *enic)
 
 	if (!READ_ONCE(enic->vf_registered))
 		return 0;
+	enic_mbox_vf_request_start(enic);
+	if (!READ_ONCE(enic->vf_registered)) {
+		enic_mbox_vf_request_finish(enic);
+		return 0;
+	}
 
 	err = enic_mbox_vf_send_request(enic,
 					ENIC_MBOX_VF_UNREGISTER_REQUEST,
 					ENIC_MBOX_VF_UNREGISTER_REPLY,
 					NULL, 0);
-	if (err)
+	if (err) {
+		enic_mbox_vf_request_abort(enic);
 		return err;
+	}
 
 	err = enic_mbox_wait_reply(enic, 3000);
 	registered = READ_ONCE(enic->vf_registered);
+	enic_mbox_vf_request_finish(enic);
 	if (err)
 		return err;
 	if (registered)
@@ -719,6 +761,7 @@ void enic_mbox_init(struct enic *enic)
 	 */
 	if (!reinit) {
 		mutex_init(&enic->mbox_lock);
+		mutex_init(&enic->vf_mbox_request_lock);
 		init_completion(&enic->mbox_comp);
 		spin_lock_init(&enic->mbox_state_lock);
 		enic->mbox_msg_num = 0;

-- 
2.43.0

