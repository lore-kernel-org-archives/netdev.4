Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146757;
	b=PdycLjR6zwdYCoTp86el/74W7LK4uPxfOVWak5SNyaYiGVIVAvJ+ZmV5VYV3TfbBmjcK
	 rk/Y2PZQdiSBGxSWnwTyEVN3ZTWiKMChM/iAwBOn/20/c4f6LavU29/Z4MVmj2nUUKcmu
	 joGo+sM3cWrY1aNowoFkpnOD5GnWe9I3HOWB94JAjaxpBOdeHmNntm3CUbYiVp264+Qcy
	 NWGBeldBVdBZjtltM+zmQn27x0Dfrb6xrioNXX51glAN8qHigNgxJDLyow3WJSwRDyyNV
	 XkB25G2n0FRpzLLW+Dr4g48FCd1y5ATmIG1xvqlTJ37kh9Ho0b2j9kvEVTSf0Qe5dOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146757;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Vk43NxPh8XX33si4IuoEVrgmoIALj8Q7G2XJui241Mw=;
	b=YWkuO7n/BzMNrHWMTlSp5lPM6wFUnDUpAD0t7KAOL5p+BavlP/SXXYB5S0b9H4FNmV0N
	 lLSrg0PLgzegdcgxi3Bg5z6BQnf2wA4K9SZrZfTceFvcfhjYNrCZguvbvM3rjcn1iDjQg
	 d4pMBQLSC2RWY9pEr3I5FaED/vhCjArAbzUHh8SjF0E/SohL23b7u2v/6exzaBDSDA4eu
	 HoGNMw/pL5hK4UPiIjN2pQ5aZOSrv2dxEXPkGJ8FKgP9zal3lraoN/85ksXVh0I6qGZ6L
	 E1DIDhI/V9qLdQRjwuQ8OrNvJdWa5pLiOmjDlamKa4Ym5uYB9pwavTVevTFXVhl8bjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntg7ULnn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4669606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntg7ULnn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725B01F000C4;
	Fri, 20 Nov 2026 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146756;
	bh=Vk43NxPh8XX33si4IuoEVrgmoIALj8Q7G2XJui241Mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ntg7ULnng+/u4jHey47jVa4o2H5jX7zjZp5NXTdo+W5ZVV0NfnudSGgoBXGdzx000
	 xqxMsJkF+2l4xrijYvbGTV/s64MwqozcZiARRjOjvmfraIAWpFaQqtzx24EpnC+VXD
	 ETUrCALoV1s7NO95IA8327WclGAnnOARqagAbvPUp5WllML4d8nBrNli4nCQmxEFrC
	 UsIj6Mij3MupmOs4cyvIvu3wQRfQpD8Ml7UYZ6F33u/aWlXX1uHwlZ7kkIBU+UgTwv
	 n93/X7MKLjHjOQDL003F4aPpHE1dEQhnmMeA2bJcQGfVwhhIYB8m7tNs3CCtcR4qNO
	 GUnE0JDQiSexA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	bjorn@kernel.org,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 1/7] eth: bnxt_en: order event data before setting the sp_event bit
Date: Thu, 19 Nov 2026 19:52:08 -0800
Message-ID: <20261120035214.369158-2-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035214.369158-1-kuba@kernel.org>
References: <20261120035214.369158-1-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Producers of sp_events may store data for bnxt_sp_task() right before
raising the event, e.g. the IRQ affinity notifier publishes the new
TPH Steering Tag, the async event handler records the FW echo request
data or the FW reset wait limits. set_bit() is not ordered, so on
weakly ordered architectures the event bit may become visible first.
If bnxt_sp_task() is already running it can consume the event and
read the stale data. The queue_work() which follows only re-runs
the task with the event bit already cleared, so the update is lost.

Add a helper which issues smp_mb__before_atomic() before setting
the bit, it pairs with the fully ordered test_and_clear_bit() in
bnxt_sp_task(). Use it for all events, including those which carry
no data, so that new producers don't have to think about it.

Reported by an LLM reviewer while working on subsequent patches.
Very unlikely to matter in practice.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - convert the producers which set the bit directly (Björn)
v1: https://lore.kernel.org/20261118023905.3050661-2-kuba@kernel.org
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 33 ++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 52606db3f7b4..9ddd75a0fd2f 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -392,9 +392,18 @@ static void __bnxt_queue_sp_work(struct bnxt *bp)
 		schedule_work(&bp->sp_task);
 }
 
+static void bnxt_set_sp_event(struct bnxt *bp, unsigned int event)
+{
+	/* Make the data the event carries visible before the event bit,
+	 * pairs with test_and_clear_bit() in bnxt_sp_task().
+	 */
+	smp_mb__before_atomic();
+	set_bit(event, &bp->sp_event);
+}
+
 static void bnxt_queue_sp_work(struct bnxt *bp, unsigned int event)
 {
-	set_bit(event, &bp->sp_event);
+	bnxt_set_sp_event(bp, event);
 	__bnxt_queue_sp_work(bp);
 }
 
@@ -403,9 +412,9 @@ static void bnxt_sched_reset_rxr(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
 	if (!rxr->bnapi->in_reset) {
 		rxr->bnapi->in_reset = true;
 		if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)
-			set_bit(BNXT_RESET_TASK_SP_EVENT, &bp->sp_event);
+			bnxt_set_sp_event(bp, BNXT_RESET_TASK_SP_EVENT);
 		else
-			set_bit(BNXT_RST_RING_SP_EVENT, &bp->sp_event);
+			bnxt_set_sp_event(bp, BNXT_RST_RING_SP_EVENT);
 		__bnxt_queue_sp_work(bp);
 	}
 	rxr->rx_next_cons = 0xffff;
@@ -2751,7 +2760,7 @@ static bool bnxt_event_error_report(struct bnxt *bp, u32 data1, u32 data2)
 			    BNXT_EVENT_THERMAL_THRESHOLD_TEMP(data2));
 		if (notify) {
 			bp->thermal_threshold_type = type;
-			set_bit(BNXT_THERMAL_THRESHOLD_SP_EVENT, &bp->sp_event);
+			bnxt_set_sp_event(bp, BNXT_THERMAL_THRESHOLD_SP_EVENT);
 			return true;
 		}
 		return false;
@@ -2817,18 +2826,18 @@ static int bnxt_async_event_process(struct bnxt *bp,
 				netdev_warn(bp->dev, "Link speed %d no longer supported\n",
 					    speed);
 		}
-		set_bit(BNXT_LINK_SPEED_CHNG_SP_EVENT, &bp->sp_event);
+		bnxt_set_sp_event(bp, BNXT_LINK_SPEED_CHNG_SP_EVENT);
 	}
 		fallthrough;
 	case ASYNC_EVENT_CMPL_EVENT_ID_LINK_SPEED_CHANGE:
 	case ASYNC_EVENT_CMPL_EVENT_ID_PORT_PHY_CFG_CHANGE:
-		set_bit(BNXT_LINK_CFG_CHANGE_SP_EVENT, &bp->sp_event);
+		bnxt_set_sp_event(bp, BNXT_LINK_CFG_CHANGE_SP_EVENT);
 		fallthrough;
 	case ASYNC_EVENT_CMPL_EVENT_ID_LINK_STATUS_CHANGE:
-		set_bit(BNXT_LINK_CHNG_SP_EVENT, &bp->sp_event);
+		bnxt_set_sp_event(bp, BNXT_LINK_CHNG_SP_EVENT);
 		break;
 	case ASYNC_EVENT_CMPL_EVENT_ID_PF_DRVR_UNLOAD:
-		set_bit(BNXT_HWRM_PF_UNLOAD_SP_EVENT, &bp->sp_event);
+		bnxt_set_sp_event(bp, BNXT_HWRM_PF_UNLOAD_SP_EVENT);
 		break;
 	case ASYNC_EVENT_CMPL_EVENT_ID_PORT_CONN_NOT_ALLOWED: {
 		u16 port_id = BNXT_GET_EVENT_PORT(data1);
@@ -2839,13 +2848,13 @@ static int bnxt_async_event_process(struct bnxt *bp,
 		if (bp->pf.port_id != port_id)
 			break;
 
-		set_bit(BNXT_HWRM_PORT_MODULE_SP_EVENT, &bp->sp_event);
+		bnxt_set_sp_event(bp, BNXT_HWRM_PORT_MODULE_SP_EVENT);
 		break;
 	}
 	case ASYNC_EVENT_CMPL_EVENT_ID_VF_CFG_CHANGE:
 		if (BNXT_PF(bp))
 			goto async_event_process_exit;
-		set_bit(BNXT_RESET_TASK_SILENT_SP_EVENT, &bp->sp_event);
+		bnxt_set_sp_event(bp, BNXT_RESET_TASK_SILENT_SP_EVENT);
 		break;
 	case ASYNC_EVENT_CMPL_EVENT_ID_RESET_NOTIFY: {
 		char *type_str = "Solicited";
@@ -2877,7 +2886,7 @@ static int bnxt_async_event_process(struct bnxt *bp,
 			   type_str, data1, data2,
 			   bp->fw_reset_min_dsecs * 100,
 			   bp->fw_reset_max_dsecs * 100);
-		set_bit(BNXT_FW_RESET_NOTIFY_SP_EVENT, &bp->sp_event);
+		bnxt_set_sp_event(bp, BNXT_FW_RESET_NOTIFY_SP_EVENT);
 		break;
 	}
 	case ASYNC_EVENT_CMPL_EVENT_ID_ERROR_RECOVERY: {
@@ -2955,7 +2964,7 @@ static int bnxt_async_event_process(struct bnxt *bp,
 		if (fw_health) {
 			fw_health->echo_req_data1 = data1;
 			fw_health->echo_req_data2 = data2;
-			set_bit(BNXT_FW_ECHO_REQUEST_SP_EVENT, &bp->sp_event);
+			bnxt_set_sp_event(bp, BNXT_FW_ECHO_REQUEST_SP_EVENT);
 			break;
 		}
 		goto async_event_process_exit;
-- 
2.56.1

