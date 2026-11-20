Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195095;
	b=DngnMK9xEEpQagqwD0m63lGZUUrS+tgzO3TZpDdbktvdwbdeqcuiz+wr7UO4UYS5hBgp
	 yQK09QlmhWOzY08MkBhFJhPqbuHsch0OczHyoFQe0woMM9rPpbUDCixas9HiHRmWt2iU2
	 t8bL/1rO16BJCMMBrO0rNczganogoJkvK3Ndh5OgD7aLC3ArM3Fd6H0dF0GjyepLnV8wS
	 nMXijbjqbryki7+nWEgleElO9mpe2Y15858fPTovmmgpQ1s/ILPOTy6H0UeB3tOlyKXW9
	 vbot72DFvhF1fMV7hn/0JnxzPemMfLmHWKV7X28CtXUiw6ptou2ov9OSGUGHAHzTVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195095;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=AZupsUQMqiQNyfqcGbUVPw6PfgmkDT6THpgQqR0DePc=;
	b=KyYzzebNKVQizKbwJEM5183SCNk7m1DLZBti+vu/+8EuseXPh43RZ2CUjThH7qnGlZJU
	 5nNscDzWyJjd5NkUrDDBpQOX2t7SuQLFWZnEkyzfqtxpayMEqseVCcxet/yNRfXYjg8QE
	 DW7WPaWHZKzmSFJtxaI6DGM83cIjgciH8++R/Bbhx3M1wpUMvyyINfvoUapYndz6XAm1I
	 X2aO2lckFW/yGO+uyMcdtNp8nBfR+RdM0SJi9/X6WjNcXGnRcQ1lTt+FXrvn0PLTR78lF
	 M66saqqwJ0524IyzGcPpOxx/zylbOIhbfZzvZVj67OPS1W/ge2dnJe4U4t5Fk1h5Vsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GZWeYw4y;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B367606A335
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B367606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GZWeYw4y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795195092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AZupsUQMqiQNyfqcGbUVPw6PfgmkDT6THpgQqR0DePc=;
	b=GZWeYw4y1/KQP3eaoX7taVLNwu2FsNT9YUmVkqAIU6H/x7hC2DMA4nIxO97aj5vJ2q6xV+
	N3goek2kS4yvcySJg4MEdT15XVWP0QC3aSlly383Pv96mZAm3bhizPaygN4Ah4kOElkSlC
	ukBm8HvXGJMlEAvFlHGQOaJJrCUEaA4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-9eWgoDy2N16JscmxKsQjFQ-1; Fri,
 20 Nov 2026 17:18:09 +0000
X-MC-Unique: 9eWgoDy2N16JscmxKsQjFQ-1
X-Mimecast-MFC-AGG-ID: 9eWgoDy2N16JscmxKsQjFQ_1795195086
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1819E1800550;
	Fri, 20 Nov 2026 17:18:06 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD2A5195B3C9;
	Fri, 20 Nov 2026 17:18:01 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Min Li <min.li@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Richard Cochran <richardcochran@gmail.com>,
	Petr Oros <poros@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] dpll: zl3073x: do not block DPLL callbacks while PTP ops wait
Date: Fri, 20 Nov 2026 18:18:00 +0100
Message-ID: <20261120171800.327855-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The PTP clock operations hold the channel lock while they wait for the
device: up to 1 s for a pending ToD write to be applied on the next
1 Hz edge, up to 1 s for a previous TIE write and up to 3 s for a
previous output phase step. The DPLL callbacks and the periodic state
check of the channel take the same lock, so they wait as well. The DPLL
callbacks wait under the global dpll_lock, which stalls the requests
for all DPLL devices in the system.

On a GNR-D system with a ZL30732, device-get requests for both DPLL
channels and for a DPLL device of ice took 950 ms in median while
settime() ran in a loop on the PTP clock of channel 0, and 2955 ms
while adjtime() did output phase steps in NCO mode. With this change
they take 2 ms in both cases.

Only the PTP clock operations use the ToD, TIE and phase step
registers. They need the channel lock only for the channel mode and
the list of output pins.

Serialize the PTP clock operations with a new per-channel ptp_lock and
take the channel lock only to read the mode and the output pins and to
issue a TIE write or a phase step. Wait for the previous TIE write or
phase step before taking the channel lock, with tie_lock or
phase_step_lock held, and check the mode again under it, so the write
or the step is issued only in a mode that supports it. The lock order
is ptp_lock, then tie_lock or phase_step_lock, then the channel lock.

Fixes: 1db73ce01856 ("dpll: zl3073x: add PTP clock support")
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/chan.c |  60 ++++++++++----
 drivers/dpll/zl3073x/chan.h |   2 +
 drivers/dpll/zl3073x/dpll.c | 153 +++++++++++++++++++++++++++++-------
 drivers/dpll/zl3073x/dpll.h |   5 +-
 4 files changed, 173 insertions(+), 47 deletions(-)

diff --git a/drivers/dpll/zl3073x/chan.c b/drivers/dpll/zl3073x/chan.c
index ba4d303d41b47d..3d0388f28e7bcc 100644
--- a/drivers/dpll/zl3073x/chan.c
+++ b/drivers/dpll/zl3073x/chan.c
@@ -460,6 +460,25 @@ int zl3073x_chan_df_offset_set(struct zl3073x_dev *zldev, u8 ch, s64 offset)
 	return rc;
 }
 
+/**
+ * zl3073x_chan_tie_ready_wait - wait for the previous TIE write to complete
+ * @zldev: pointer to zl3073x device
+ *
+ * The TIE write operation is shared by all channels, and the device can take
+ * up to one second to complete it.
+ *
+ * Context: Caller must hold zldev->tie_lock.
+ * Return: 0 on success, <0 on error
+ */
+int zl3073x_chan_tie_ready_wait(struct zl3073x_dev *zldev)
+{
+	lockdep_assert_held(&zldev->tie_lock);
+
+	return zl3073x_poll_zero_u8(zldev, ZL_REG_DPLL_TIE_CTRL,
+				    ZL_DPLL_TIE_CTRL_OP,
+				    ZL_POLL_TIE_WR_TIMEOUT_US);
+}
+
 /**
  * zl3073x_chan_tie_write - adjust DPLL phase using TIE write
  * @zldev: pointer to zl3073x device
@@ -469,6 +488,8 @@ int zl3073x_chan_df_offset_set(struct zl3073x_dev *zldev, u8 ch, s64 offset)
  * Converts nanoseconds to TIE units (0.01 ps) and writes TIE data
  * to the specified channel.
  *
+ * Context: Caller must hold zldev->tie_lock and must have waited for the
+ * previous TIE write with zl3073x_chan_tie_ready_wait().
  * Return: 0 on success, <0 on error
  */
 int zl3073x_chan_tie_write(struct zl3073x_dev *zldev, u8 ch, s64 delta_ns)
@@ -476,14 +497,7 @@ int zl3073x_chan_tie_write(struct zl3073x_dev *zldev, u8 ch, s64 delta_ns)
 	s64 tie_data;
 	int rc;
 
-	guard(mutex)(&zldev->tie_lock);
-
-	/* Wait for any previous TIE operation to complete */
-	rc = zl3073x_poll_zero_u8(zldev, ZL_REG_DPLL_TIE_CTRL,
-				  ZL_DPLL_TIE_CTRL_OP,
-				  ZL_POLL_TIE_WR_TIMEOUT_US);
-	if (rc)
-		return rc;
+	lockdep_assert_held(&zldev->tie_lock);
 
 	/* Convert ns to TIE units (0.01 ps = 10^-14 s) */
 	tie_data = delta_ns * 100000LL;
@@ -500,6 +514,25 @@ int zl3073x_chan_tie_write(struct zl3073x_dev *zldev, u8 ch, s64 delta_ns)
 				ZL_DPLL_TIE_CTRL_OP_WR);
 }
 
+/**
+ * zl3073x_chan_phase_step_ready_wait - wait for the previous phase step
+ * @zldev: pointer to zl3073x device
+ *
+ * The output phase step operation is shared by all channels, and the device
+ * can take seconds to complete it.
+ *
+ * Context: Caller must hold zldev->phase_step_lock.
+ * Return: 0 on success, <0 on error
+ */
+int zl3073x_chan_phase_step_ready_wait(struct zl3073x_dev *zldev)
+{
+	lockdep_assert_held(&zldev->phase_step_lock);
+
+	return zl3073x_poll_zero_u8(zldev, ZL_REG_OUTPUT_PHASE_STEP_CTRL,
+				    ZL_OUTPUT_PHASE_STEP_CTRL_OP,
+				    ZL_POLL_PHASE_STEP_TIMEOUT_US);
+}
+
 /**
  * zl3073x_chan_phase_step - execute one output phase step operation
  * @zldev: pointer to zl3073x device
@@ -511,6 +544,8 @@ int zl3073x_chan_tie_write(struct zl3073x_dev *zldev, u8 ch, s64 delta_ns)
  * All masked outputs must use synthesizers of the same frequency since
  * the step value is in synthesizer clock cycles.
  *
+ * Context: Caller must hold zldev->phase_step_lock and must have waited for
+ * the previous phase step with zl3073x_chan_phase_step_ready_wait().
  * Return: 0 on success, <0 on error
  */
 int zl3073x_chan_phase_step(struct zl3073x_dev *zldev, u8 ch,
@@ -520,14 +555,7 @@ int zl3073x_chan_phase_step(struct zl3073x_dev *zldev, u8 ch,
 	u8 ctrl;
 	int rc;
 
-	guard(mutex)(&zldev->phase_step_lock);
-
-	/* Wait for any previous phase step operation to complete */
-	rc = zl3073x_poll_zero_u8(zldev, ZL_REG_OUTPUT_PHASE_STEP_CTRL,
-				  ZL_OUTPUT_PHASE_STEP_CTRL_OP,
-				  ZL_POLL_PHASE_STEP_TIMEOUT_US);
-	if (rc)
-		return rc;
+	lockdep_assert_held(&zldev->phase_step_lock);
 
 	rc = zl3073x_write_u32(zldev, ZL_REG_OUTPUT_PHASE_STEP_DATA,
 			       step_cycles);
diff --git a/drivers/dpll/zl3073x/chan.h b/drivers/dpll/zl3073x/chan.h
index 99c3b7088f678f..55932e950e7e6e 100644
--- a/drivers/dpll/zl3073x/chan.h
+++ b/drivers/dpll/zl3073x/chan.h
@@ -52,11 +52,13 @@ int zl3073x_chan_tod_write(struct zl3073x_dev *zldev, u8 ch,
 			   struct timespec64 ts);
 int zl3073x_chan_tod_adjust(struct zl3073x_dev *zldev, u8 ch,
 			    struct timespec64 delta);
+int zl3073x_chan_phase_step_ready_wait(struct zl3073x_dev *zldev);
 int zl3073x_chan_phase_step(struct zl3073x_dev *zldev, u8 ch,
 			    u16 out_mask, s32 step_cycles, bool tod_step);
 
 int zl3073x_chan_df_offset_set(struct zl3073x_dev *zldev, u8 ch, s64 offset);
 
+int zl3073x_chan_tie_ready_wait(struct zl3073x_dev *zldev);
 int zl3073x_chan_tie_write(struct zl3073x_dev *zldev, u8 ch, s64 delta_ns);
 
 /**
diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
index 1cdadb8e46fb2d..0b605945ee6184 100644
--- a/drivers/dpll/zl3073x/dpll.c
+++ b/drivers/dpll/zl3073x/dpll.c
@@ -2460,7 +2460,7 @@ static int zl3073x_dpll_ptp_gettimex64(struct ptp_clock_info *info,
 	struct zl3073x_dpll *zldpll = container_of(info, struct zl3073x_dpll,
 						   ptp_info);
 
-	guard(mutex)(&zldpll->lock);
+	guard(mutex)(&zldpll->ptp_lock);
 
 	return zl3073x_chan_tod_read(zldpll->dev, zldpll->id, false, ts, sts);
 }
@@ -2478,11 +2478,52 @@ static int zl3073x_dpll_ptp_settime64(struct ptp_clock_info *info,
 	struct zl3073x_dpll *zldpll = container_of(info, struct zl3073x_dpll,
 						   ptp_info);
 
-	guard(mutex)(&zldpll->lock);
+	guard(mutex)(&zldpll->ptp_lock);
 
 	return zl3073x_chan_tod_write(zldpll->dev, zldpll->id, *ts);
 }
 
+/**
+ * zl3073x_dpll_ptp_phase_step - execute one output phase step
+ * @zldpll: DPLL channel
+ * @out_mask: bitmask of outputs to step
+ * @step_cycles: phase step in synthesizer clock cycles
+ * @tod_step: also step the ToD counter
+ *
+ * Waits for the previous phase step without the channel lock, as the device
+ * can take up to three seconds to complete it. The step is then issued under
+ * the channel lock, so it is issued only in NCO mode.
+ *
+ * Context: Caller must hold zldev->phase_step_lock.
+ * Return:
+ * * %0			- success
+ * * %-EOPNOTSUPP	- channel is not in NCO mode
+ * * negative		- other error
+ */
+static int zl3073x_dpll_ptp_phase_step(struct zl3073x_dpll *zldpll,
+				       u16 out_mask, s32 step_cycles,
+				       bool tod_step)
+{
+	struct zl3073x_dev *zldev = zldpll->dev;
+	const struct zl3073x_chan *chan;
+	int rc;
+
+	rc = zl3073x_chan_phase_step_ready_wait(zldev);
+	if (rc)
+		return rc;
+
+	mutex_lock(&zldpll->lock);
+	chan = zl3073x_chan_state_get(zldev, zldpll->id);
+	if (zl3073x_chan_mode_is_nco(chan))
+		rc = zl3073x_chan_phase_step(zldev, zldpll->id, out_mask,
+					     step_cycles, tod_step);
+	else
+		rc = -EOPNOTSUPP;
+	mutex_unlock(&zldpll->lock);
+
+	return rc;
+}
+
 /**
  * zl3073x_dpll_ptp_adjtime_phase_step - adjust sub-second time via phase step
  * @zldpll: DPLL channel
@@ -2503,7 +2544,7 @@ static int zl3073x_dpll_ptp_settime64(struct ptp_clock_info *info,
  * Return:
  * * %0			- success (or partial success if a later synth group
  *			  failed after the first was already stepped)
- * * %-EOPNOTSUPP	- no synths available
+ * * %-EOPNOTSUPP	- no synths available or channel is not in NCO mode
  * * negative		- error
  */
 static int zl3073x_dpll_ptp_adjtime_phase_step(struct zl3073x_dpll *zldpll,
@@ -2517,10 +2558,13 @@ static int zl3073x_dpll_ptp_adjtime_phase_step(struct zl3073x_dpll *zldpll,
 	bool tod_stepped = false;
 	s32 step_cycles;
 	u32 synth_freq;
-	int rc;
+	int rc = 0;
 	u8 i;
 
+	mutex_lock(&zldev->phase_step_lock);
+
 	/* Build per-synth output masks from registered output pins */
+	mutex_lock(&zldpll->lock);
 	list_for_each_entry(pin, &zldpll->pins, list) {
 		u8 out_id, synth_id;
 
@@ -2540,8 +2584,11 @@ static int zl3073x_dpll_ptp_adjtime_phase_step(struct zl3073x_dpll *zldpll,
 		}
 		synth_mask[synth_id] |= BIT(out_id);
 	}
+	mutex_unlock(&zldpll->lock);
 
-	/* Process each synth group */
+	/* Process each synth group. The synth state is read before the PTP
+	 * clock is registered and does not change while it is.
+	 */
 	for (i = 0; i < ZL3073X_NUM_SYNTHS; i++) {
 		synth = zl3073x_synth_state_get(zldev, i);
 		if (!zl3073x_synth_is_enabled(synth) ||
@@ -2560,33 +2607,74 @@ static int zl3073x_dpll_ptp_adjtime_phase_step(struct zl3073x_dpll *zldpll,
 		/* Safe for s32: max synth freq is 750 MHz */
 		step_cycles = div_s64(delta * synth_freq, NSEC_PER_SEC);
 
-		rc = zl3073x_chan_phase_step(zldev, zldpll->id,
-					     synth_mask[i], step_cycles,
-					     !tod_stepped);
+		rc = zl3073x_dpll_ptp_phase_step(zldpll, synth_mask[i],
+						 step_cycles, !tod_stepped);
 		if (rc) {
 			if (tod_stepped) {
 				dev_warn(zldev->dev,
 					 "Partial phase step failure\n");
-				return 0;
+				rc = 0;
 			}
-			return rc;
+			goto unlock;
 		}
 		tod_stepped = true;
 	}
 
-	if (!first_synth_freq)
-		return -EOPNOTSUPP;
+	if (!first_synth_freq) {
+		rc = -EOPNOTSUPP;
+		goto unlock;
+	}
 
 	/* No enabled outputs found; step ToD counter only using the
 	 * first enabled synth's period (empty output mask).
 	 */
 	if (!tod_stepped) {
 		step_cycles = div_s64(delta * first_synth_freq, NSEC_PER_SEC);
-		return zl3073x_chan_phase_step(zldev, zldpll->id, 0,
-					       step_cycles, true);
+		rc = zl3073x_dpll_ptp_phase_step(zldpll, 0, step_cycles, true);
 	}
 
-	return 0;
+unlock:
+	mutex_unlock(&zldev->phase_step_lock);
+
+	return rc;
+}
+
+/**
+ * zl3073x_dpll_ptp_tie_write - adjust DPLL phase using TIE write
+ * @zldpll: DPLL channel
+ * @delta: phase adjustment in nanoseconds (must be in (-1s, 1s))
+ *
+ * Waits for the previous TIE write without the channel lock, as the device
+ * can take up to one second to complete it. The write is then issued under
+ * the channel lock, so it is issued only in a mode that supports TIE.
+ *
+ * Return:
+ * * %0			- success
+ * * %-EOPNOTSUPP	- channel mode does not support TIE
+ * * negative		- other error
+ */
+static int zl3073x_dpll_ptp_tie_write(struct zl3073x_dpll *zldpll, s64 delta)
+{
+	struct zl3073x_dev *zldev = zldpll->dev;
+	const struct zl3073x_chan *chan;
+	int rc;
+
+	mutex_lock(&zldev->tie_lock);
+	rc = zl3073x_chan_tie_ready_wait(zldev);
+	if (rc)
+		goto unlock_tie;
+
+	mutex_lock(&zldpll->lock);
+	chan = zl3073x_chan_state_get(zldev, zldpll->id);
+	if (zl3073x_chan_mode_supports_tie(chan))
+		rc = zl3073x_chan_tie_write(zldev, zldpll->id, delta);
+	else
+		rc = -EOPNOTSUPP;
+	mutex_unlock(&zldpll->lock);
+unlock_tie:
+	mutex_unlock(&zldev->tie_lock);
+
+	return rc;
 }
 
 /**
@@ -2616,17 +2704,26 @@ static int zl3073x_dpll_ptp_adjtime(struct ptp_clock_info *info, s64 delta)
 	const struct zl3073x_chan *chan;
 	bool sec_adjusted = false;
 	struct timespec64 ts;
+	bool is_nco, is_tie;
 	int rc;
 
 	if (!delta)
 		return 0;
 
-	guard(mutex)(&zldpll->lock);
+	guard(mutex)(&zldpll->ptp_lock);
 
-	/* Modes without phase step or TIE use plain ToD adjust */
+	/* Hold the channel lock only to read the mode. The ToD, TIE and phase
+	 * step operations below can wait for up to seconds and they do not
+	 * have to block the DPLL callbacks for that long.
+	 */
+	mutex_lock(&zldpll->lock);
 	chan = zl3073x_chan_state_get(zldev, zldpll->id);
-	if (!zl3073x_chan_mode_is_nco(chan) &&
-	    !zl3073x_chan_mode_supports_tie(chan))
+	is_nco = zl3073x_chan_mode_is_nco(chan);
+	is_tie = zl3073x_chan_mode_supports_tie(chan);
+	mutex_unlock(&zldpll->lock);
+
+	/* Modes without phase step or TIE use plain ToD adjust */
+	if (!is_nco && !is_tie)
 		return zl3073x_chan_tod_adjust(zldev, zldpll->id,
 					       ns_to_timespec64(delta));
 
@@ -2661,12 +2758,12 @@ static int zl3073x_dpll_ptp_adjtime(struct ptp_clock_info *info, s64 delta)
 	}
 
 	/* Apply sub-second delta via phase step (NCO) or TIE write */
-	if (zl3073x_chan_mode_is_nco(chan)) {
+	if (is_nco) {
 		rc = zl3073x_dpll_ptp_adjtime_phase_step(zldpll, delta);
 		if (!rc)
 			return 0;
 	} else {
-		rc = zl3073x_chan_tie_write(zldev, zldpll->id, delta);
+		rc = zl3073x_dpll_ptp_tie_write(zldpll, delta);
 		if (!rc)
 			return 0;
 	}
@@ -2719,6 +2816,7 @@ zl3073x_dpll_ptp_adjfine(struct ptp_clock_info *info, long scaled_ppm)
 	 */
 	offset = -div_s64((s64)scaled_ppm * 67108864LL, 15625);
 
+	guard(mutex)(&zldpll->ptp_lock);
 	guard(mutex)(&zldpll->lock);
 
 	chan = zl3073x_chan_state_get(zldpll->dev, zldpll->id);
@@ -2747,20 +2845,13 @@ static int zl3073x_dpll_ptp_adjphase(struct ptp_clock_info *info, s32 delta)
 {
 	struct zl3073x_dpll *zldpll = container_of(info, struct zl3073x_dpll,
 						   ptp_info);
-	struct zl3073x_dev *zldev = zldpll->dev;
-	const struct zl3073x_chan *chan;
 
 	if (!delta)
 		return 0;
 
-	guard(mutex)(&zldpll->lock);
-
-	chan = zl3073x_chan_state_get(zldev, zldpll->id);
-
-	if (!zl3073x_chan_mode_supports_tie(chan))
-		return -EOPNOTSUPP;
+	guard(mutex)(&zldpll->ptp_lock);
 
-	return zl3073x_chan_tie_write(zldev, zldpll->id, delta);
+	return zl3073x_dpll_ptp_tie_write(zldpll, delta);
 }
 
 static s32
@@ -2926,6 +3017,7 @@ zl3073x_dpll_alloc(struct zl3073x_dev *zldev, u8 ch)
 	zldpll->id = ch;
 	mutex_init(&zldpll->lock);
 	INIT_LIST_HEAD(&zldpll->pins);
+	mutex_init(&zldpll->ptp_lock);
 
 	return zldpll;
 }
@@ -2941,6 +3033,7 @@ zl3073x_dpll_free(struct zl3073x_dpll *zldpll)
 {
 	WARN(zldpll->dpll_dev, "DPLL device is still registered\n");
 
+	mutex_destroy(&zldpll->ptp_lock);
 	mutex_destroy(&zldpll->lock);
 	kfree(zldpll);
 }
diff --git a/drivers/dpll/zl3073x/dpll.h b/drivers/dpll/zl3073x/dpll.h
index 993221dc63249d..eda37239ef1e3a 100644
--- a/drivers/dpll/zl3073x/dpll.h
+++ b/drivers/dpll/zl3073x/dpll.h
@@ -19,10 +19,12 @@
  * @ops: DPLL device operations for this instance
  * @dpll_dev: pointer to registered DPLL device
  * @tracker: tracking object for the acquired reference
- * @lock: per-DPLL mutex serializing all operations
+ * @lock: per-DPLL mutex serializing DPLL operations and channel state access
  * @type: DPLL type (PPS or EEC)
  * @lock_status: last saved DPLL lock status
  * @pins: list of pins
+ * @ptp_lock: serializes PTP clock operations, taken before @lock, which they
+ *	      hold only while they use the channel state
  * @ptp_info: PTP clock info
  * @ptp_clock: registered PTP clock (or NULL)
  */
@@ -39,6 +41,7 @@ struct zl3073x_dpll {
 	enum dpll_type			type;
 	enum dpll_lock_status		lock_status;
 	struct list_head		pins;
+	struct mutex			ptp_lock;
 	struct ptp_clock_info		ptp_info;
 	struct ptp_clock		*ptp_clock;
 };

base-commit: 4d67cf2fd2352f130c42494a933ba9158b925c65
-- 
2.56.1

