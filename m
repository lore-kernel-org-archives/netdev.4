Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495373;
	b=hXqUrX2OKJUXrGV/NjmWeqb/zC8I/y2MXM9N6PQFHvMhIgjND3Gs8xqPPFmThuacxuYb
	 jW/wueoJZs7iOoUAcT65fulj83NzEuXt9vVjS/iDPfpDKHxpe68flcz7jqn26t67fWAEm
	 QhIK357Xczbi8mUbx0mjIwxTh+U5IEdgFYdswPlMcgx2rkwYlgRBGo9jdcO2sHu6nd+c2
	 sBGuKfoqF0dULYU8qJhtZgGGS9lVg/Riq2PxD6oH5PtVLZ5nPxa9D6fWf0EnCtYSt/NvC
	 higRvuav461AyzWsbgESg3rNod0kMW2mRT5nI7oD7gaEucsOZLwJPdh/N58FYBJJeXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YUDl8mbt1Ws917z9q6VKmMNT7CVVkOmO5/VpgLmd0SM=;
	b=gJDEEyQ9LqwfVPQ3KKBfBqmLR3/OMHXWDwnl43YwxsUPyt8xmTGJEKOCud/pCWUhGV2R
	 GARyThBsnNx/LsVFsBLl8hVSHAy+MnpM876httaea2Ew69SMPTMhxnm2LRlsA5dlp0PqH
	 I3ylrVicHbwrTYkdz02iGM1V3v1nrcb9AI5MtbIcISoPlPl5ISB8dgAcEErWjncJHekF8
	 29NQVfWcy3bgb2Z8BQrxilGzA+pkXj2cvBn/3eK4Y6tN7bSC9NL6wFwsaS5ftKyPiR8/j
	 BOGQCsRvlmSX9PohElQarQaUw4ExTeREzpAj+ZfRSsdi04zZ+L6IQdhSO8iHcmp+NHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKxFuXqC;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4EC606A683
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4EC606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKxFuXqC
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3984757c88.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495372; x=1796100172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUDl8mbt1Ws917z9q6VKmMNT7CVVkOmO5/VpgLmd0SM=;
        b=IKxFuXqC4Aywg2AqLOhUG6PQnz5flmGNz8H+RfiXqMcSx6z1D1CAzbrwp1519ooR8c
         1XoqTbxfvNuIobDTkgM63t9tlSh0J/Bo2Gr5Ye9kd56Pzn9QL07Xv6waGxWYYBMM+off
         c0358wc1CmtIDf03wFEgIAEvX/sXGO6sgrcDCQGl2TFdKG5ZcY9N1s+cTPc8Tl2Pn4Gi
         H9ADOIvy6Bzm99OXEkxJw4TioloMomKR3CPh9gkKc09jekuSsCkAwSzSfbnprwQ0u1Bn
         jrz/UtCGIqhGYOJkKSlclG8dhqdw6W1Z+P2jPNs8IZkHBQilVkn/zuop703AEwiNm23W
         GCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495372; x=1796100172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUDl8mbt1Ws917z9q6VKmMNT7CVVkOmO5/VpgLmd0SM=;
        b=C+t7NAMkK8qBuyx7vPt0bLMfg2QBGk/W/qR3qE1YBZL//MlNGoieGIxb4QZ83n7GTt
         sLrvsYjstDxvdJ3a3vthKgRmZ0DK8G+L09qnkbURo73BaGTO3onHiDYQkKPpOwf1wcAC
         LoCwgt34ythdAmVlBg78uCdppOC25nDum1Bx6Ov8Dh3uspxg10LK1PBbPwd/mv6OlS03
         xFN1QDGk/HyANBMAeO9UvmuEVVHu1ymWXVdSldz6Ds39W4O4yKA1EunMZDCITcpF91Xu
         JUMe5YDoVHoGKmR7boMCkJpiU1mEpmKOOvgRvbgOYNXGW72sLf7JOpooivwyrSsaKVem
         C8gw==
X-Gm-Message-State: APuU4Z/979RJGDpfizVTfJYDjcHAFRURoX/rq6ufjPanqZdARIUNeD8E
	cII7eOLZ2qsj3VXbtetQkCZsjjfzHiuPF9iaNeGlvLpFq9g2H4gP9S2+VQq4MMMq
X-Gm-Gg: AZFdTZc2w8Xch6HQ7bS6YYXqRITrI7wDVVwfXlZ5osnweVAxaZuTXyhBmqBWt1JGImV
	/0zf3hcO45SaERxOboZec1Y50E79rjFSuSYOtgda9p8K3Rgo2TUPDBoEHgHGg45tahFCx8DVo5F
	eh+fYeksipqs4CjTuoqxalJyfcho3tSW61jizK0XDyxCzolYG5rTlbbkMNsCa/46UI4a5ufbyWW
	/QtpTa/8MPWMN7fX4VP+akQ+SWCZcQf1eQWFYmKmLjzzZNBpqt9+OGN5hXVsUDLdSCwzUKpYNEF
	7WnLl+eZbf8v3tFkKAh13pW5d28DLR77ZWOXlMDYgY7HDCXhwW4F4gDHRKPgLj2Q/6JbugRqoyl
	SlIWDUjIWCoaCJ48g5/URwBUsErKgtQcBJ3vkC44jSVt8M8El1pxb31IGsL4l5X6X6V/j7SElen
	oUEp5NUE5Z/WA/xJeTw6jBhvHYkkAr99SDtGyW3rTfy0d2konXd/AxzZ9EoURVKIrSStPjRWB2t
	pd6Hff5U/AcQVZccozYTxurpl9z1JRQ4l1YQXRJRH0R9Q2O0ys4KkeKTeAOmaZ5B+75WPaCFU/7
	/XdyIMiCYDyVUY4IRXKCV0RDmMvLCAHmtVX19YHyEvmzN85o2XixdlZw2MIIyFB2MEJuoNuEvl6
	Yg0ntH5BNm31hRlenh4ER6uON0AHWpuyOY0QNtbeslLe97gSLIxK1g/QSArl9qWKaxT1aEna1
X-Received: by 2002:a05:7022:1583:b0:16e:c820:b20d with SMTP id a92af1059eb24-1b5567b2204mr13970761c88.5.1795495371714;
        Mon, 23 Nov 2026 20:42:51 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm31208084c88.3.2026.11.23.20.42.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:51 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 7/8] ptp: ocp: correct the DCF output frequency
Date: Mon, 23 Nov 2026 20:42:49 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-7-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

The output selector table uses 77000 Hz for DCF, whereas the input table
and the DPLL supported frequency list use 77500 Hz. A request for the
advertised DCF77 frequency consequently fails on an output, and reading
that output reports a frequency outside its advertised set.

Use 77500 Hz for the DCF output selector as well.

Source-derived set/readback tests with stubbed MMIO fail at 77500 Hz
with the old entry and pass with the correction under ASan/UBSan.
No physical card was tested.

The issue was reported by the Sashiko review. Codex assisted with this
table correction, its regression test and the changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Renumbered from v4 patch 4; code and commit message unchanged.
 - Preserve Vadim's Reviewed-by on this unchanged correction.

Testing: actual DPLL set/readback for 77500 Hz passes with stubbed MMIO;
restoring 77000 Hz fails at runtime.

 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index e27abe2c24c7..821ecd1a13c8 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1373,7 +1373,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
