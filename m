Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399062;
	b=nRoqSp8g9gMIwJdd61HD6ZgAMwidXXHJKIp48I/Q+nboMAzu5jASdAnjFG/GgRk96zZQ
	 3Htzy+kLb5h+AAKzrumsBqEJPwPqsBePEEZm7yJvRHTZZnJpdbUciS6C1qsLxt50aNvVq
	 HordcnwDiPza25XoxCArbM051w2JXoBf1/o8741bbBxP21tyvXnq3u3AdGKmWwaOMeBQN
	 smtmXldVYVVugb+KOSMEgZA2L/i1ZSPRVUzFh+KODa3QJK2Biqpf7+1ls/3UCPSr6zQ46
	 5U7PYDXwZOeLDA62yWU6mhU0J4iBvTE6huT0odlz9M2llr7Iy/0Qcd8FrG+MGZLX2Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yz+h8e6nlUGS3YHD1p73owGomONCcK+wC5nQNATZT5I=;
	b=5XRZ4qAiEdXVbdFoRTvPiAh1WX8/OMxq5857Z7X4En3d6oX5Hz939hSoocuZa9MPA+zU
	 EwULpMRErzOiblZhhyDZG4JKiTj5/OqdPYIJrKwy8i9Q0gGPHd+ZJXVp0m87u114SKbAa
	 5yhFGg3SsgIW6uK8iujzO9CB9zmDTKnZ2ztg9EppjPXKiNHZ+DtkMVOvtqW2+v0c+D1vI
	 7/79hyZA2aN4eHk+I7bZrUnzSlJSA9db9qY8Hn3fAz8gFeD7KoqHZotUdhRPIBJEx7kKR
	 q9mqnpdKsk/JQbT151nypTg7dIBeXS5WYvG8viNbUrVKkgXsLc3vglEBCUnPaDSoRHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e+ia0Ge/";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97D606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF97D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+ia0Ge/
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so969997c88.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399061; x=1796003861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yz+h8e6nlUGS3YHD1p73owGomONCcK+wC5nQNATZT5I=;
        b=e+ia0Ge/5Z+b5LRVJTFyzd5GeA3yjJkTZV1waFmedghs32YyHpqSFNlGcPvO8m7cOR
         bYEYNUpsM2S4xd1U38UG9cAnu/rq67gHZHlDRWYRnQU2Fgwn4vV5tjKTxvouhibYyTYu
         LrWL0dBQQmgzIOVmWVm7sOAc3qxvylTWw9sZ1HO181sRz3m4xc6kAv0Lc7ZXmH2Eou6W
         vKb+qlpujLDnUqMpYTUML3ZWQjd/oYWI1Qp8KGfVTgs1JQ8BQLk8IkRgWNrBAmb0yUkI
         zSmc3sA8A7x9WOywWXuFGgsOPHsE4s33y56gJXBoZS7l98dtt+R5cX+K+4eCPrTGzABL
         jUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399061; x=1796003861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yz+h8e6nlUGS3YHD1p73owGomONCcK+wC5nQNATZT5I=;
        b=Yhz2WqnFdse22Nt73szr7PDfBSclAU66o/CreRjmUInB8gkQY/SDR/k1fSDcndj36f
         Fb0P4z4Up5ajWqLh+WRMVMcdkhO/t+R4mMCUq/2eneezc4Mhi4DHTSwzhf6380x5Q7+p
         cmG7mXiypDqQ4Kp6O4MUedKpf2ejpl2kLzRmxVgWkpK8wQaaGaG0Z/RSHp660WdPJshx
         d/0Pagh02maaSSRuKCLyTcmSSijP9Zlo8QuW4UZvTf/OUfF73PZemixjlGqD/JljH5jN
         Sv2dQN3zWmMZ4iQyT2t9LW3ljLBV0bvxnoI+5qbZuSAkmUPmEJM7LFZucUI7AjrvXfjz
         LY7g==
X-Gm-Message-State: APuU4Z8VU491A7DC5JBJaWovMf6c45JAC1K2eBXVUh10jvpWP1c4Efer
	EvZMHdTwSIT7zIaY7Lw58MTR+eGgBUIAgf1l91U85y3Jt0e5qnFxI56QZt3g31xK
X-Gm-Gg: AZFdTZf/4qBVBBZgdvVuyvnSQfM7j+pioMFs7DapUyvON/oE4rM1sOXEjnY57i6Yddd
	H0XLD2HShcVLAred+8vjEiOsWIj6dN2+SEbrlJKJ9JvYSZcLjfZ97CAj6xYX9brLidhVaNTNcFl
	hb3hfDVwtx/wOR8td6r8Za2KbwIroJsg0J/wYRUqsybdSdaqV8/24Decxs3pCjMoJTkwO3IWkGq
	F+ve6wKPeZhdCH29SXareNYQuYCiH7JixYPL91uH2kCJVSj4QnBunXovQMX6MoxmWfboa76p3My
	Sz0ZBqAzuAS7OjVTqC7z6PXJXbwibE9oY6jEZU0KCytcVNOfWTEXz6Z7P6omfkSgedXsTL0x2BJ
	+xH4bbZNdw+j8576Qvsc49gcah7sdcuddVIW6CiW+uzamygZ2dy0BZQB5etYUUbYaXdpWGIQmqZ
	q7UBU6FcNw3ofZjv/yRe0z8lPfT8JO2faD27d4qX2W5CG67buoqKK6HTGWg+sHtZlgntvy7xDmk
	9Pxpin44zefLg8ycbxDeFva0SZwikNrOHUUTiRptXB6OixurP4Kw1Zdo5wqEzcOhggdWnIH0YZR
	t9UIm+pyCtkpSIIQhKju5FK42b3tC6dQ1BYiWY3aLgjdiY8isjSvTNOcfJrtNGAPmIf/a2zrFfa
	MiyfNKhmVa3UNE6Ho0wwhu5MyXIn42bdV0s5s3SCr4iOHrWi+0CWb6x7jkVj+Vq/fhOUBL5SO
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr6018064eec.36.1795399060780;
        Sun, 22 Nov 2026 17:57:40 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm25648335eec.25.2026.11.22.17.57.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:40 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v4 2/5] ptp: ocp: handle hardware selectors and combined DPLL input routes
Date: Sun, 22 Nov 2026 17:57:38 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-2-ahmadexp@gmail.com>
In-Reply-To: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
References: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
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

The selector table index is not the hardware selector value. Passing the
index to the SMA setter can select unrelated signals. Use the table
value, as the sysfs path already does, and mask the direction enable bit
before looking up the frequency.

Inputs can feed several destinations. For example, IN: TS1 TS2 produces
selector 0x000c, which is not an individual table entry. An exact-match
frequency lookup fails with -EINVAL, preventing the DPLL core from
reading the old frequency before a later frequency change. The error
also propagates through the DPLL pin dump.

For input combinations, report a known frequency only when the selected
frequency-bearing destinations agree. Timestamp and counter destinations
do not constrain it. Report zero when there is no known frequency, when
destinations disagree, or when unknown selector bits remain. This uses
the same zero-frequency representation as individual timestamp routes.
Keep the exact-match requirement for output selectors.

Source-derived tests reproduce the selector and combined-input failures
using stubbed MMIO and the DPLL core get-before-set function. They pass
with the fix under ASan/UBSan. No physical card was tested.

The issues were reported by the Sashiko review. Codex assisted with the
code, tests and changelog in response to those reports.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v4:
 - Handle input masks with multiple destinations and make ambiguous
   frequencies explicit as zero. Keep exact output matching.
 - Drop the earlier review tag because this expands the implementation.

Testing: 4,669 input masks across FB/ADVA/ADVA X1 tables, timestamp-only
and mixed-frequency routes, unknown bits, strict output matching and
recovery through the actual DPLL core get-before-set function. The old
source fails the combined-input test. Selector, mask, combined-route and
conflicting-frequency negative variants fail at runtime under ASan/UBSan.

 drivers/ptp/ptp_ocp.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index b16d36c3305f..df1a428eb2fe 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5869,7 +5869,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (tbl[i].frequency == frequency)
-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
+			return ptp_ocp_sma_store_val(bp, tbl[i].value,
+						     sma->mode, sma_nr + 1);
 	return -EINVAL;
 }
 
@@ -5887,6 +5888,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	int i;
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
@@ -5894,7 +5896,28 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
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
