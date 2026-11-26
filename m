Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711288;
	b=OtSL61lWVIsZH9cdLol8sbtghAotQwHlXybFs8nu8a8Zwd0GyGAzI8jY7/2s6tLYecyD
	 hRPli7RGw3VmKeujMuhfqQj3YnHR4sFvRP5HsM2yofr+tbHqPIyNLV9sN3v8JmR8+VJbg
	 Fr+Ah7rxJ8+t8z9x/0TMac93nrwWn2A3PyyN4n5alwUgn6AuSGn8E/tDyp5QaEbgxYd6x
	 NvcdfM7Fwwxnl7/IqKqQZN555QWOg1ikHiBSLnADPHQ+y4uR7gZK28HdZg5BVWfAbs54p
	 c+1BO+PNzdQG8B/iFfmVH0FVFmvuygsW2A0w8j3zTbHYUqmdayNaOkyPIhQkDMM03Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hVfV9uvXnE+bWUZPWsItXQSATMeWVREDW1IUclPxPkM=;
	b=VxVoshNFAs+SDuYW9ZjE9Z5kPCI8ka6nbeyrxTJZbmXBE69XOgad+iDZtRM2lOoNwdoH
	 Au9jYDqX9aCEcjxQpkqC8dAkdxmJCrnRM2Kv5wCC2aahZhuHQw8lZUpV1/q9k01s2/XFd
	 W9uAT+DnfyohCjfIAyUXfMZAnmsl5sjkfm25Gbhpt/WJO718FDQVHNtBztWRqrAFrdb/U
	 kMWQhyM/n3gTNK3IcZjt2iOD6F9WYdIdLZI+MQJGjGTzbVVXTw1/YbI4NJumVO8HUJrZl
	 XCmsEzsGNitGFZVTbDMoAZDZqnXHOhi00s7ZFZZtwmk6KTIsYE7ECZRdADzAlPZtsvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tld5X8/4";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5526606A339
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5526606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tld5X8/4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15253712eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711287; x=1796316087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVfV9uvXnE+bWUZPWsItXQSATMeWVREDW1IUclPxPkM=;
        b=Tld5X8/4YPb+014wlTnxZRm08LbkpW5GpzIR3Ge6X9eTp+FbmnRCITSLpZdvebq5aN
         zGWqHGlDM8Fo4PjwSAWEKDX0IK2SgDL4ak9Ca3PbposL+kP258OH2otroY5+murRdH7e
         oRy6ooolGxiKOLPa3L7KCWper0P2aK2CF9xc5ZAkLXGFZfvbviDoi5zMDV0IP9fj/+X+
         QGuk9DmHiUvHqndU8wCoxLNjSsiiXt6HCzu7Q5cfjmvTl2l/wPgAM07QGTI3uSCFkI9/
         7jSrsDnKZpaACY52Y7Jj8FqHkzBmDDz9tYkk3p9FXq5Mw2doYAsYqg+oIxEA/hIrxmDk
         869A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711287; x=1796316087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVfV9uvXnE+bWUZPWsItXQSATMeWVREDW1IUclPxPkM=;
        b=yI4skOx2aF/kkB1syHLKQx/2rU6Lsetw7/VVPkze1uNcFuIN/wSJRWYxXsWfNUPqNu
         JV0DjLZtqfp/mTFGjgFL/vFnmcvcq+Re6pBu0Kd+nZnR5kv39uxbAlpWl8nWGlkQhuVK
         zGWoi4CKz+CMtP+pAIeUH1mbW38Ap+YL3uokfH6ix0LupxK7WSdyQT0ZxF6XPpK1Qe1c
         v85nR6569sjdufvnmOKI8wQYm1cCmcfY+mpSDHCuBRf1U8hJUxopyMIyx1M2xoaXFFRA
         pRkPye8LPGXX8H5UC5BtZxnUFGlPK8oplDEga/HHvbMHTKgK4gfsYnYpD1AGihjiL9s7
         x/LQ==
X-Gm-Message-State: APuU4Z+nlGCUW+wJu0c1TB8euVndQBHYX0GdvCSRDBQVElh0xQV8CyMJ
	ghyrRpiszugIYkp/khlEuxhtqFzoE+K1M4mUsk/3zuQy9zEsFds29MGHEt/Nm38H
X-Gm-Gg: AZFdTZfKW3WnqOcriZI6Qw6JW8rXYREw/Qn4A8SITAM6ArHkKEr0fO5nDe8wcGn3/iO
	ANArMywZN4c0AmUXC0a0ejEL6gnAItRrXbnf5cOsqxHzLFhpFpP/fVRwIYOdIX1cBrJQkf76Jlp
	npHgMRfmpGAoakYT/pJO58FPvk9hfN/2hoD4RrGUNiVXxwC4aOKdkHPV+IZHVmZDbKr21xX5Akr
	HMnw1AudhC2QVBwwT6O0CnAHEJHwGPitcoYPtSw9/8R0+uCyuENIWccbQ3zIg2A72b1VtpJwUct
	pI2dbdbhszY2ulXyUH7hHdjjdpddjRjE7h/IZJvFuL84QkNXHEOWoHoAyHQfmrVbEMi92UUIoVD
	gyThCyoGG9g31BW6TN3y0TZqnYiRsCZEeswwKEu7WxOavCPXGa6//atFxDGmQ7Ym8Wk6VPePAUR
	G/ZisXZPCo2jHWkM105DxGiWR7v2+lSEdGyTrNqIjZA5Uq3KR7YXYky8UFptHfLOyaqhrbxYbNK
	67/wN0xkxz/4D+ZkF9abjKbdQAJLd/7AcM56q2t/oBofTHcsHzvwrnL+i7iKSnUxXQFSuSgBW3x
	o4b63rQnBX1dA/3RawgSAN7cEYT6ZCAIhJJ6G4oUic+7YQDa0O7x09rFxMctgn06qGNlg2AxnXf
	QgcXSgiGJaKBuvYN2YGRyq/i92EVH9VtF03QKWNTrJIbeyAnc8DfYOp3TvmEZkZK+1HkUQ/C5
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr17900569eec.15.1795711286860;
        Thu, 26 Nov 2026 08:41:26 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm55903706eec.19.2026.11.26.08.41.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:41:26 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew+netdev@lunn.ch,
	arnd@arndb.de,
	john.stultz@linaro.org,
	rmk+kernel@armlinux.org.uk
Subject: [PATCH net v6 2/2] ptp: disable unassigned timestamp channels on unregister
Date: Thu, 26 Nov 2026 08:41:22 -0800
Message-ID: <20261126-timecard-core-v6-2-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-core-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-core-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

PTP_EXTTS_REQUEST can enable a channel without assigning PTP_PF_EXTTS to a pin. ptp_disable_all_events() currently walks only configured pins, so unassigned channels can remain active after the clock is unregistered.

After removing the user interfaces and draining active operations, issue a direct PTP_CLK_REQ_EXTTS disable for every advertised external timestamp channel. Keep pin assignments unchanged and retain the existing PPS shutdown. This is a PTP core change and does not modify any clock driver.

A coding assistant helped identify the unassigned-channel teardown gap, develop the core fix and regression tests, and prepare this changelog. The regression harness exercises the actual cleanup path with controlled clock callbacks; no physical card was tested.

Fixes: a60fc3294a37 ("ptp: rework ptp_clock_unregister() to disable events")

Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_chardev.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index f63b45f5ee6a..5835c01cddb4 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -53,11 +53,15 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
 	unsigned int i;
 
 	mutex_lock(&ptp->pincfg_mux);
-	/* Disable any pins that may raise EXTTS events */
-	for (i = 0; i < info->n_pins; i++)
-		if (info->pin_config[i].func == PTP_PF_EXTTS)
-			ptp_disable_pinfunc(info, info->pin_config[i].func,
-					    info->pin_config[i].chan);
+	/* EXTTS requests do not require a pin assignment. */
+	for (i = 0; i < info->n_ext_ts; i++) {
+		struct ptp_clock_request req = {
+			.type = PTP_CLK_REQ_EXTTS,
+			.extts.index = i,
+		};
+
+		info->enable(info, &req, 0);
+	}
 
 	/* Disable the PPS event if the driver has PPS support */
 	if (info->pps) {
-- 
2.54.0 (Apple Git-157)

