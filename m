Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711336;
	b=ayZpf/53CoW0eNLT1q9QCFd9G1UrC2tzAPNipjN4jy1pZjcmO1Io2gvP5ZfLY2QVZnpS
	 p5sXncae+NBrF4aCvVfNwTTDk6hkeu/PTzDIGrYp8fQDq5qGhQ5qjBcRkSsfz3iru15Zs
	 gEiOuHFUea8mkxgQcXX/1bX7lNb1S5y7aCqMYnIwFqPL0BraZIJSvq/YhPL3oKwrwJL1L
	 qINXQzNy/ryrEqgAvQlyZhRvBIxKM2YAtCp4yFF1BXs/ukt+n+PQWu9Fozpzjd//5gtcy
	 SOwYVBgMDD/Rx3AwDEfAXzRlEefAA2hcLyE+OXcksDCZClkl2q/9EKbyD4EMkfBG0rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pmk+sIZTt3w0WtAkxU0Aj/ecWCHoLEzaJTgVNQnsM0k=;
	b=RZt1DP7xLfmbbfOJAuvj0i4QnN1bqAkFapFidiSfwqGSVv/v1qKuTOXoirAn5Ik6jDdM
	 6sMHr9ptYkudWuOLfk499ksjcCpSyTJ33btOVkG5XZGVcmnq5O/DGWCh26GUQBskimLbk
	 Ua2lq98pALdcZ0bMN0V/YzaMxNNrkNIr+pHMSCGOPdmgTv1f7FQ/ShtHD1ig3UFuE2YLQ
	 k5MrfxXKwegPd2KBav68nn/SJm5g7XGvrpRv+ACLDj+8r16KMTvMrfAvp19YCU9KN2NO7
	 hhHV2PvRSyYI0kz4BM8FB+a2/N4/I7f0mJspsc5s8AzauFjOlWil66dbysiUVe4X+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNMH7WHJ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E060A261B
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781E060A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNMH7WHJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386b8f2f671so4085212eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711336; x=1796316136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pmk+sIZTt3w0WtAkxU0Aj/ecWCHoLEzaJTgVNQnsM0k=;
        b=DNMH7WHJFQB+wN775CiJuduR7WvVjAAUrs7squmv4mc9JUVd5BlEkKWAdtE191NYsA
         fg6x+jJwH22wu2d768nC1M8rq1yDL08M/uKkb4uS4VYHElBcxqdJJsGIoB3GPxNcUfkB
         ToW9TY8ddx72IP/xrQlTdCNxt8nRGb3VLDihfIt/XaHB2XuCFkxWXGfO2t1YkxfzGEiM
         fS0MYvAvcMssbUmVDTJK+YOAP2j3mm2F1SwtYHm/EbtFiLBUXeDNOS14pMxq9VCtPmCP
         X6+RWtsso8wnr8X4PR1OlOM1Y7HSCIyVUMoaiDrODYTn3AyDPaf0OgD/+6SF702nsXju
         59YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711336; x=1796316136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pmk+sIZTt3w0WtAkxU0Aj/ecWCHoLEzaJTgVNQnsM0k=;
        b=FaaK02acmlE0OK6aO0qoF+2GKxxEz2QE59TjlgZQpMfPHpSbuArCPPpNLVo5IqNvA6
         Pas1S6WL7W6EllD9yR3i0gGfcdvVRH3cGdHq0IBKmj+c0K0yo8glRibaJbDeSFK/Zvr9
         Lp10F7RfF4whKBUPEaPwxyRwqzAWv/2b0fsGhRA4IYQXr6EDsNqKTAxIjpBMdNg8KQJZ
         SV33RHAWKEAmetuMenNsROhhwTON3eF8RmqCFyc/mYwiVeeMkTE6FlbF7M16okzegmKO
         Nw45s9rbfoHOwhGEr4Vsb2/4qAUgYzGNOzdKnQF16ttnYhOlzznGCNrS+c8zJfhLPSFE
         1G8w==
X-Gm-Message-State: APuU4Z8IymDLNe56cKBNmYKyJtr5JtCA2DSiw76dHbIOfH+BAHPT8s7T
	UTUsQfXIOaFTM3Nh199UETG7Q09rfUnG2EkrlSEywg2RUrSFX3wEyQ/ZTWjcy7MX
X-Gm-Gg: AZFdTZcQ3Sq5Oyr76AXnDg1T9IZBOFb3BW9k8F2nIe3luNhcVwqO1qKlgTUFqonxDd2
	gYcg87UfzRfO2Pk6d4EQUAcD/3QeZdoQ6afnm7KBu9b30gMJjn4lMm7EKF+sQKxaQuGqVFK3pM5
	5yXWsq/nMjoPMlh1MD6DRPSwx5SWCNOBq14on+Iy5vqWJE4sSQvMicIJO6fKSdGAEedHoc7Be7v
	FKz22NJ6qA30RyKYbg1sHyskGNNYr9q6ETcTxj7VHDgbO3heUdKujVCi/6zHxrE5o7pRuUCjMak
	8NOqlyBxsw49GUwZRL/KwfgZgfIzjOGqw9+2InS+Buz4Tbu1HVROjeImRwKIeOfyQDUTeJhjeCl
	IdCrYrUtNz+QED1LIRvnK1o6B6Jnr17pOOFsJ3h7FfaUGRXTVOUfRGGMCVktoejoresgZ5njhBH
	Z8uQOYPCckt8+SYjhC74SZxMo+hhtAuvVRhbKMs59mRJCJmiCDMyaQ+MbBbapI2D18Zq6BAV9O3
	gvEFymeGZGYlPqDuRpSqMYtjQxIU4P+mA25ZQammejF9v5dP/93BWhtJSO57nBK0YD9pS2yGUdq
	MfjzMNqyjWzca2fRELheprl2Jx/3dqq+rAgO/NcukYE+u4PESi+iBF0AU1F2j9QIukRJgBjrcC/
	jmzf2Gv2WoZ/4NFUW0n1o3XkvDmRo5Iue/fPxbu+7vSzpZBymh8a3RNuEHBsszVXVEAESiTi5
X-Received: by 2002:a05:7300:1c1b:b0:386:9d31:2d18 with SMTP id 5a478bee46e88-3869d313208mr16132034eec.0.1795711335410;
        Thu, 26 Nov 2026 08:42:15 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:14 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 3/8] ptp: ocp: preserve timestamp routes on DPLL frequency changes
Date: Thu, 26 Nov 2026 08:42:04 -0800
Message-ID: <20261126-timecard-driver-v6-3-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

DPLL frequency changes on a combined SMA input currently replace its complete selector value. This silently removes timestamp or counter destinations configured through the SMA sysfs interface.

When changing an input frequency, retain selector bits for destinations that do not define a frequency. Preserve the existing output path and continue to clear disabled inputs. This keeps the timestamp route while changing the frequency-bearing source.

A coding assistant helped identify the route-loss issue, develop the fix and regression test, and prepare this changelog. The test uses the actual selector and DPLL functions with instrumented register access.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 47 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 625a85b2dc7e..284908c6abc2 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5873,16 +5873,31 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	struct ptp_ocp_sma_connector *sma = pin_priv;
 	struct ptp_ocp *bp = dpll_priv;
 	const struct ocp_selector *tbl;
+	u32 val, aux = 0;
 	int sma_nr = (sma - bp->sma);
-	int i;
+	int i, j;
 
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
+		}
+		return ptp_ocp_sma_store_val(bp, tbl[i].value | aux,
+					     sma->mode, sma_nr + 1);
+	}
 	return -EINVAL;
 }
 
@@ -5900,6 +5915,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	int i;
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
@@ -5907,7 +5923,28 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
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
-- 
2.54.0 (Apple Git-157)

