Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807389;
	b=jnFQNTNVne+ovNfZjc8hEdIzPhfPQpap+kWU+4Hx7ExDC5HdBbZbQrRtpB6tJlsDBCeP
	 p+72amt5L5ErrONDAWCXcPaHfhTTV00QR13m/oGlmcHSB16rYZN5QqD2iynCe7oZUeW1W
	 qLwcyDUCaxLjbvZz2xEYxvrOJmPf4J64QOCZ2Cr17XmaQVut9gaRX3QEXlW4dy7tjYDfm
	 +8fLaOt1iih2pNzjJBW4o9dZgc218N9Fpvq720m0Ul92Xr0RA32OlsvOAgIbYm/37T9F+
	 dgkuYbb6R3kPujygJetxS952Pgbmx43jZ3R05yowF++f0C8vwhY8YNartj6wQXP/+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S/vNdooL3kBpcYXzJjA/Fa93LMhEj3225SgZBUEBphM=;
	b=kjqSEJPlk2fc8d3Eca5CqDhZJbOxBYMenvBONeNykJ02T9IaXM+9PMWlEZkH+Y6DkmFI
	 R817mdtgtV0ysTfKDA+VZRY1jHH89N5pjxkKMxwVYoIJpnYKmrkhdgYY/Vy2xwy5//WsD
	 2Tta3rHnGm4jf+e3k9KzbaTm7XPJGR4gkGlW/2znovW7R6hCQ+3OJvpFY5EpHOMAu/QLa
	 1Hf9ZLC3NZgACbaPVTJMSL87Tk+S+SY96MKFTXkTt2w0e3vpd8cqTOuVs5HDg97Q+Ig1y
	 lI3Z9dZm5G8mMy/e1MWtjq2TV1JDt5NySmBwlAkg9I8mXkPhgaWZNIXvf4mUi0Ml7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P2Go0tvm;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727DE606A6AF
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727DE606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P2Go0tvm
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so13789666c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807389; x=1796412189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/vNdooL3kBpcYXzJjA/Fa93LMhEj3225SgZBUEBphM=;
        b=P2Go0tvmmMiDu1/Ueuje+5HCHj2UB0FsocoX1bFFuv0fb01f9phN8lLwOFE5pAzzMu
         0WToH5L6ajgkMdTxdGbeLb3WzsbHGXqmqXJW2TVt7PFIKMaC4Q2WwVOAwOj/41QMfRCA
         WTxlJkeAKSTh/bPgCTwYiz+5lwNNE0CJuvuuiTX1yJk+FG4I6Mv/qgagCitEPT+g4/X3
         r+eN2qU0qMOo4XFROhh4XAGQQjMoF5TpYN7QOm39B8Cc1Qqyg4zUimAnfTmEQDTxsXrU
         sd3ZjOG83reRIF/Rf46AKeJWc2eRtWSmu3TA5prd344GyqWRb+Cq5DqUZjs0ubiv//NQ
         1rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807389; x=1796412189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/vNdooL3kBpcYXzJjA/Fa93LMhEj3225SgZBUEBphM=;
        b=MnQynrEHXL80ssOWbtAyjo5pnzegvj5GHLCvmM/1Qr3jGTqATlBL/IQYgpvVVxvOm/
         OeUjOWNeYNuUiG/MAfcWQ4/YOoGFDg7oHa/+c0QUqUbu9PIp5RiPDFoSl6OH2MeRzb9f
         ZwK7pwMDyyEhV01dShUVtWjhxtW1Ue+RQAWA6IPvWc0ujoxpkJQaxQk7Et5pQKJf4r8q
         vv4RdHO+mlX0ToaobLGcmZGnxLqcJ5QL/41OGcbpEdqpUFlb8gQ3/vVx9WWP4fIcqzkC
         ljUj62KsQHJwmKB7HeEHiuKxwiCNmTa6kZ/pVvccsjTRSrg1E91gdhYjXtBp8Y0sMxal
         iaqA==
X-Gm-Message-State: APuU4Z8cCUtfpR2BXbc6TGZsfQh0S+q+bFQe5o29yAwVtmRXhDPmPXu5
	TZXljq0sUWLewB+CCBr9/l6/NtppoeBWXbUQfXaBhvcnHTatLkwFVtxxjxFaxz2zIo0=
X-Gm-Gg: AZFdTZfgNipoLSsQnJGdhWyLsTjYaS4MBoXW3Ox2KKajt8rClWMl1mxDS5R1KIpXOSq
	GbXRXbFcO9lq9qmf3/dQz81BuX9WxlttJYw6B3HzttRB1uZFr9bX5KXG8ECG9dREfyGoNYE7zJU
	UmSJKnK3K5R9Ht+uK/CrzI5YfTT4DdxZEXVk1pEd+cjUDONQglIMoH9pGlRisQBytgM2EPoAiZC
	sg60Q/b63dFFOtWyYXlFZuGlfBSM6mQm4nq1npefa9Pia9oh6k6cS2QQDpaqCmgZNskPdQP3G7d
	NnvXL8Xq2kuB0Z8F0TVPHaup1ksWpH3N5xwysWFo5xYiMBXBdqbVOcQDQletR+nN+iRdRgU6DYZ
	Fw84wJgqtAJGg4Jv1kXJuNTakf0iDRZgE5xhr1cF6gPHGDVWOn2g+6+xbZp7dG0zQa9iLIVHBcp
	AhbblIRIFelc6ktg4bHJUSd0nWh25JzSIJYcxmizOoYjqXFEi9FgABmPB4w3XoCnJIaNlpbh04R
	e1eLYL9R694hwfSQnC4BUXJeP0bGqaJmW4jExnwf63N3va7RgTQvEbCuQQeY22TBP/SVksg/2c5
	eDr++AoOXm8945MDSFRBQDEJCtY8Sp5e1OxYXaCmvGPiZOnZq4wpHvYxLeiIq2V6FhGCgm5e/BR
	TclhYxQ5piapJLeUL2tXOrN8DpGRIIcus8jxTCOt19spglDo/gBDvl750qIGLEA==
X-Received: by 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr24726407c88.40.1795807388536;
        Fri, 27 Nov 2026 11:23:08 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:07 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	milena.olech@intel.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v7 3/7] ptp: ocp: preserve timestamp routes on DPLL frequency changes
Date: Fri, 27 Nov 2026 11:22:58 -0800
Message-ID: <20261127-timecard-driver-v7-3-ahmadexp@gmail.com>
In-Reply-To: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
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

DPLL frequency set uses a table index as a hardware selector and can
replace timestamp or counter destinations selected through sysfs.
Use the encoded selector on inputs and outputs, including ART. Keep
auxiliary input routes while replacing the frequency-bearing source.
Reject a zero-encoded 10 MHz selection when auxiliary routes make it
unrepresentable, without changing the register or connector state.

Serialize the read and write against sysfs, PTP pin assignments and
DPLL direction changes. Keep the existing MMIO spinlock inside the
register accessors.

For readback, mask out the enable bit and report the configured nominal
frequency when combined input routes agree. Report zero when there is
no unambiguous frequency. This does not measure the input signal.

Developed with coding-assistant support using v6 review feedback.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179579808134.3135.14342336954222031404@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 64 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 625a85b2dc7e..3781f6582b7b 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -417,6 +417,7 @@ struct ptp_ocp {
 	u32			ts_window_adjust;
 	u64			fw_cap;
 	struct ptp_ocp_signal	signal[OCP_SIGNAL_NUM];
+	struct mutex		sma_lock; /* serializes routing and connector state */
 	struct ptp_ocp_sma_connector sma[OCP_SMA_NUM];
 	const struct ocp_sma_op *sma_op;
 	struct dpll_device *dpll;
@@ -3384,6 +3385,7 @@ ptp_ocp_sma_show(struct ptp_ocp *bp, int sma_nr, char *buf,
 	const struct ocp_selector * const *tbl;
 	u32 val;
 
+	guard(mutex)(&bp->sma_lock);
 	tbl = bp->sma_op->tbl;
 	val = ptp_ocp_sma_get(bp, sma_nr) & SMA_SELECT_MASK;
 
@@ -3433,6 +3435,7 @@ ptp_ocp_sma_store_val(struct ptp_ocp *bp, int val, enum ptp_ocp_sma_mode mode, i
 {
 	struct ptp_ocp_sma_connector *sma = &bp->sma[sma_nr - 1];
 
+	lockdep_assert_held(&bp->sma_lock);
 	if (sma->fixed_dir && (mode != sma->mode || val & SMA_DISABLE))
 		return -EOPNOTSUPP;
 
@@ -3473,6 +3476,7 @@ ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr)
 	enum ptp_ocp_sma_mode mode;
 	int val;
 
+	guard(mutex)(&bp->sma_lock);
 	mode = sma->mode;
 	val = sma_parse_inputs(bp->sma_op->tbl, buf, &mode);
 	if (val < 0)
@@ -5838,7 +5842,9 @@ static int ptp_ocp_dpll_direction_get(const struct dpll_pin *pin,
 				      struct netlink_ext_ack *extack)
 {
 	struct ptp_ocp_sma_connector *sma = pin_priv;
+	struct ptp_ocp *bp = priv;
 
+	guard(mutex)(&bp->sma_lock);
 	*direction = sma->mode == SMA_MODE_IN ?
 				  DPLL_PIN_DIRECTION_INPUT :
 				  DPLL_PIN_DIRECTION_OUTPUT;
@@ -5857,6 +5863,7 @@ static int ptp_ocp_dpll_direction_set(const struct dpll_pin *pin,
 	enum ptp_ocp_sma_mode mode;
 	int sma_nr = (sma - bp->sma);
 
+	guard(mutex)(&bp->sma_lock);
 	if (sma->fixed_dir)
 		return -EOPNOTSUPP;
 	mode = direction == DPLL_PIN_DIRECTION_INPUT ?
@@ -5873,16 +5880,39 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	struct ptp_ocp_sma_connector *sma = pin_priv;
 	struct ptp_ocp *bp = dpll_priv;
 	const struct ocp_selector *tbl;
+	u32 val, aux = 0;
 	int sma_nr = (sma - bp->sma);
-	int i;
+	int i, j;
 
+	guard(mutex)(&bp->sma_lock);
 	if (sma->fixed_fcn)
 		return -EOPNOTSUPP;
 
 	tbl = bp->sma_op->tbl[sma->mode];
-	for (i = 0; tbl[i].name; i++)
-		if (tbl[i].frequency == frequency)
-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
+	for (i = 0; tbl[i].name; i++) {
+		if (tbl[i].frequency != frequency)
+			continue;
+
+		if (sma->mode == SMA_MODE_IN) {
+			val = bp->sma_op->get(bp, sma_nr + 1) & SMA_SELECT_MASK;
+			if (sma->disabled)
+				val = 0;
+
+			for (j = 0; tbl[j].name; j++) {
+				if (!tbl[j].frequency && (val & tbl[j].value))
+					aux |= tbl[j].value;
+			}
+
+			/* Some boards encode 10 MHz as an empty selector. */
+			if (!tbl[i].value && aux) {
+				NL_SET_ERR_MSG(extack,
+					       "10 MHz cannot coexist with the current SMA routes");
+				return -EBUSY;
+			}
+		}
+		return ptp_ocp_sma_store_val(bp, tbl[i].value | aux,
+					     sma->mode, sma_nr + 1);
+	}
 	return -EINVAL;
 }
 
@@ -5899,7 +5929,9 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	u32 val;
 	int i;
 
+	guard(mutex)(&bp->sma_lock);
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
@@ -5907,7 +5939,28 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 			return 0;
 		}
 
-	return -EINVAL;
+	if (sma->mode == SMA_MODE_OUT)
+		return -EINVAL;
+
+	/* Inputs can feed several destinations, including timestampers. */
+	*frequency = 0;
+	for (i = 0; tbl[i].name; i++) {
+		if (!(val & tbl[i].value))
+			continue;
+		val &= ~tbl[i].value;
+		if (!tbl[i].frequency)
+			continue;
+		if (*frequency && *frequency != tbl[i].frequency) {
+			*frequency = 0;
+			return 0;
+		}
+		*frequency = tbl[i].frequency;
+	}
+	/* Unknown destinations do not establish a frequency either. */
+	if (val)
+		*frequency = 0;
+
+	return 0;
 }
 
 static const struct dpll_device_ops dpll_ops = {
@@ -5981,6 +6034,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	 * ptp_ocp_register_resources(), so this sentinel cannot overwrite an
 	 * adapter number the i2c notifier stores during registration.
 	 */
+	mutex_init(&bp->sma_lock);
 	mutex_init(&bp->cpld_lock);
 	spin_lock_init(&bp->cpld_adap_lock);
 	bp->cpld_i2c_adap_nr = -1;
-- 
2.54.0 (Apple Git-157)

