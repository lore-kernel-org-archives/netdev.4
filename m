Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495375;
	b=no74wvuI4WTiJjIAoVGUEUwyRpLyHSSu2vJS5cNn3YXK1i2jvEhleCXUYhnsKkqxLZ9q
	 FDaCjv26nj7oNy4dejeB6HRchhFLcNrEXc/cfTVE2vUqwphm0tnZaTQgSqzV5IllWdWM0
	 h7IKf5Xcywl5tOLszDSarJVuAEnQda7oARENrmmUp0u4q34/N3vS+idrv5qAXdmBI4veE
	 qoyN9Wik8vuWLLwD2kjzMvql6y/5F1gLw0w21vnkWpl9M6ScBOF8k9jrHeSOVNJTPgJiv
	 6Lr17a0LSU2D5aTaffLS5TmCmb2Ant6U2160Rl90DGZtakjN5mZoVnlzAyVjb5g8h2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r6DJ2+NcRhcImmJIzLg7naUccIBP7jEQ9XY1zb0LzSs=;
	b=BG4KTGRN0e10JcpxwseyMeNhGSoa5ArOwEZTIL2qCehwe1TL6WL91JFZJ5+RrtwvtEhO
	 mPA7jpv9z2pgKPylLcP+gdXsMfvsUrs9CHRE1RthBauJo4Px96I9FrKHbEnkf53i5SXom
	 P0aVwAp1FOpT4CrZRAqyUE43ACINXWLK3P7BIOHMGRVukbyV67hTp861dypXZo39ODGV7
	 +8egoLzFw5BrTdWLjJut0EdT8YUs6qKKa03WJYPDDxikPrITaAXNdbqecdbxGFcXgr3ss
	 pmrLVAh7Ow+GozLkpFRqESLwy2LGnunQnptRe8mmOZ/WIT2yvHMtG0vx/FkTCqEpJHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5zx+L12;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0C606A692
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D0C606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5zx+L12
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso162116eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495374; x=1796100174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6DJ2+NcRhcImmJIzLg7naUccIBP7jEQ9XY1zb0LzSs=;
        b=c5zx+L1246VuRkA4KKg5GEV/kp/edMm7u2unadwAvSqe+BtGeUuP3Q+FJ2clrqTWVf
         OP22bSKQiyuTLjSSd0tZ91/lB6QhYkxMyDLIL0/hzQw5oq5DiFjfZ/6Ku4g8Pnfy6Wl6
         iL6yZZZtKQaA7fJxR9Ol2Jm2WuP3wryzMT8E2ZDVZTG0WEpwCyEcLEgQC7XNTFb3LLxX
         gATicXb66n/bfIBVxBfxXOgDMJACkrOgaGYVoF4aFvlqNWZjShxTbXB2u9rScDApHvKo
         ahzQsOaeUSFC/I93nixveQLsL8YnsIRnLh1nfkbXHtbfz6MJZMlQ9GnYHpYwIJkQRbK8
         Aa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495374; x=1796100174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6DJ2+NcRhcImmJIzLg7naUccIBP7jEQ9XY1zb0LzSs=;
        b=tf3Viu0m17LUG5QMM+tEYsBTBPGBBR7JSR0Epk5ISiVkOgV3gq7F0TOQYig30Hb0t+
         Kwsap8MiHtsTEqvZVikI0SNxRhJZC93FWeGJnO+pS9+/4VAaGLhJQLa/5WBZfysDxPcb
         9gYHgx3OvVrw1gIzjQ7Evy6QapQDN6gr9bXZsDHm30ZKOSqqcvdIlO/2FuAQ/S2qilVA
         KSTHHeIh/GNpmpzYGg6qk+QXs+HQ1cuuN74H12wliuq14YgldLS3GEvxsbtFLwCKY0i3
         StrSmLyToPejB8HdEwi99mLPUqHv63bAg9Tf3gkICxzQqKamAknF3NwPCfXv3YE7MwL5
         4W/w==
X-Gm-Message-State: APuU4Z9scwqjwVudE+eBG/WmY7P3fMJVjzhJs2MSQGjhakESr/QJD7R5
	iDCwCQGQOvMhweePlDhO9gwKnnLFfCraiTtgH5/bSPMwISQ+MhjcY+mREheYPvrX
X-Gm-Gg: AZFdTZcvI/kaAFXGd3g4Su2vLMM1KExGKR0Hdf7wcu70qIApKR+hUwHJQlTBChbXtsE
	U6NTTWApLjQ8kOQt+/8lfbvb6NBhE/Tlxopsnx++d5kjDjL3v0vWk1L/ERudPa5wvBdqe9P9k0Z
	gbU2QFI99M/y6b1TpMoaT/dVa4emeRnEkRi317onOaP+3k+iOzL6HcsckYKtxPlN6GiSQI4sGG8
	/LREOphv8lfqhCKWzzCtvW/0gJc2mF0qeH/3/9ayyzQy3+2Aru+bWy/3RuT5dW2X0zTT5gq/ajj
	XJnTI7oDxJ8253+UL3QDYH3HjUnjp/k1E2D+KhMTf0HHk8mBFL/kJ1VCMaiZagA3t1ITCqnB0dr
	ow0lYgxuZEs2HV2oQDWJttoAk67KyIvlE9mJlOIC0fcqBrNsXNao0b4SMC9vgCaT2jwAhyRVTXU
	Tw9LjEUu5+/5PKW1FZGW/QbI8/58sINItG4qea+RWD5yk8TVV72fYSDmrMR0M29M2PuptUqlXgU
	AdBVGyMNNDMvf0GpKu3rngpqZNqYMp9khVgfPSW4ZtxhWSOJeZ4/xSAS1/eUWNaPb71ChjGxB93
	kxPcyKTozfYwmbbZOQx8Bjhm9Eujkk/zcxNBv36MkaDSal9R799+oZRCwM9jel7rdc/+nV8hkmu
	Jo+dyXNITdqzmN4lLUtbY7AIHLErBQ3ZUmg+ZUAlx+4fUeR1HhkwfkNs+8IufVqFAF1TXo1DkPU
	v1n3mgAnsHePc0NxnlfQ==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr4234085eec.21.1795495374007;
        Mon, 23 Nov 2026 20:42:54 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm29427540eec.1.2026.11.23.20.42.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:53 -0800 (PST)
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
Subject: [PATCH net v5 8/8] ptp: ocp: correct the ART 10 MHz input frequency
Date: Mon, 23 Nov 2026 20:42:51 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-8-ahmadexp@gmail.com>
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

The ART input selector named 10Mhz has a frequency of 1000000 Hz instead
of 10000000 Hz. ART pins advertise 10 MHz, not 1 MHz. A request for the
advertised value passes the DPLL core's supported-frequency check but
matches no input selector, so frequency_set returns -EINVAL. Reading
the default ART input selector 0x08 reports the unadvertised 1 MHz value.

Use 10000000 Hz for the ART input selector, matching the advertised
frequency and the corresponding ART output entry.

Tests using the actual ART accessors, stubbed registers and DPLL core
frequency validation reproduce both failures and pass with the fix
under ASan/UBSan. No physical ART card was tested.

The issue was reported by the Sashiko review. Codex assisted with the
table correction, actual-accessor regression tests and the changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
Link: https://lore.kernel.org/r/179538007070.3135.8275620503580456948@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Renumbered from v4 patch 5; code and commit message unchanged.

Testing: actual ART accessors and DPLL get-before-set validate 10000000 Hz,
reject 1000000 Hz, and check the fixed-pin default. Restoring the old
frequency fails at runtime. No physical ART card was used.

 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 821ecd1a13c8..93923d5a2992 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1385,7 +1385,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 
 static const struct ocp_selector ptp_ocp_art_sma_in[] = {
 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
-	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
+	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 10000000 },
 	{ }
 };
 
