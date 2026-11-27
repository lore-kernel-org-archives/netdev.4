Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807394;
	b=m3OwJuINJ87os1+fBp5Gn1YRXWBwsZnraIxMpj3KnRe5vixWHNoeHjUo/zm2DC80ZdMe
	 Rs/eTl4WB7AkS4Tc0Q92D8/ae1pLP54L9VABS54RzJDUED368c/0nFXXBplE6eiTuqMla
	 pFnnUpIK69MR87Nx5sNgvw9sD/pOBdjRplJVEzNyJSq6eEhzKURoqVPVNuF7PFM2/3pVV
	 9WMooabPdOGKv8T8yucKXUzLujoQHPo9u+tiyNkFpIskPEbTvKkjEvZ1zMa2jXiN0XSEx
	 g0il+bb5endjGS7p57a1gcDhSLXJH6Q7oYwkAT8dmKSlbY7iHyIkTzpywxWD218JD7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JHtyg2ycX00R7q/QFCBLLC/oriNJBfx7ZXkiqzOr38M=;
	b=4HlsxDrJ0LJn5aYNfOXWgj0wYZvutC8SiQfvtA4dTkeScdjJVW4gWFacKBfLh5f9G2Tp
	 ljS1FuoMj3tmEeAAwWaBhZCOVcKO6Kl5KYA+A7lSeTcYQ06FkQvy9fUT2xDXymjU8dX47
	 I5otDZcmisZinbCjfa3ep5lsU3uoEvlglk9gmedA9lDh4BmaFq9LyopR/9t23c1Sd/jwO
	 PhP0y9LE/ghqGnD3toSEl3p91VnksvyEag65cld9xUmTn+6htdFw3i8xGXcVI9EOCudCu
	 6+GEwOsR8WRZLdwhQFFAu2uoX7cgZfhGuIR8qNqLfQNlhTsqn/mF74AYbNRkP7+tOOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wklAGA32;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D260A2606
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738D260A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wklAGA32
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so12569704c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807393; x=1796412193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHtyg2ycX00R7q/QFCBLLC/oriNJBfx7ZXkiqzOr38M=;
        b=wklAGA32wZ8AscOolDlMW5DzhIYKrOBdp8lqtBJN3ph0HCvDXkSI/zhTnKMqSl6OWp
         kP3+98gPm9PZFFHll5pvd6DcRv1i+VLsxma7TVUYwH4XrdmKH6z4onHm8UmOTxnLKxwd
         VvilCs/DhYJhzPyqXjYcWLSHHiB9z7b7qJxyxTaZ52koWMEAJ70HVNBbcl6wNca9Cg2R
         tX7CVIDbBu0GY12wZD5KL+YunltXMD0AdFEhS+CzrNopxQLPyiY8e7QNFthQoChhMKij
         E6I6g7vhWy0Krd/pyOeIiIqEuioYZfdBQDxUZgiYOkGF0bGTCgC8NyPHAjuvVzTc0lkz
         lrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807393; x=1796412193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHtyg2ycX00R7q/QFCBLLC/oriNJBfx7ZXkiqzOr38M=;
        b=wdHOlshAiGkS5sI4YznGrkgWw9EKbFG0tbIRYc4SgASndMGUx88nYxpkhMBzF7Nmjn
         PJzZ3b+wT7azc8lzyouNkAKw2kSCnhhQERJbz6axl0/TkJ7AoJWL9mdkyeY8rbfbf57P
         8BNa36XEQXaSwxpT1FYQwvs1qivmaBnWQqfsTtbBIwintrxwtwD/dv2rSlMGoU0EkubZ
         15CIWcV1SpMrxAVUJqfFcvh7c4+RWdsfb/AuLlTHkwprgVba54QEUGbUBN/DsbC2UJ0p
         8IdlhsaQTK1zyI0cFulcLT2ojc+zbQpS8luVW/BayvLCKJSNv5IxIHzbt7WogXZQZzFD
         Aw/A==
X-Gm-Message-State: APuU4Z+J8Wcs8Kz1P20RMMxpGVYg2l3/I7ltwZmQFcz32gGV9pve3pPE
	LZV9JtQkLE28fi9JtD8X1/QmKZG6UFk7si7rj/VBjbaaXGnfXufoNg7XRyqUjUz1Ffw=
X-Gm-Gg: AZFdTZfgZdqnIsHO1SJ74DDnW3Iiec1uwZrz/KykDMf/hM6x/AuxfHpJWI0u6jVK/Hr
	nlkWgGmhwTiBURm/17Fodp78PXDHdaJ+xN5cK9yxlHCHtNB8Mz9waVOezEdXtEtiYlW+5marb70
	eVttv6Z0gKJ36M1bbuGhJ0ICSv08I6dbIb0oKzlUn7yCTMEvOO74fFcOQEiDgzgI86jWC7J3O5c
	Y3NSNszWQE1JDuY8aSagGb9n5bgPkER56zBwbCmPUEpBX1S6kg+nQ4iFLH9MDpbgexh5Ozn9CFA
	sYzsCa7NRKa66+HXwTAXB9EhmFXf48yj2Njj+sRpczcS9vj3ScuxDmBabCXLPoyKJK2/hVEqtHV
	/5ups3DM1xccwefDbiEwNBqO75AKbetm23gqEf0FgknI21SRD3StH8vJkcBhi8ErUa6A2lYl9ZL
	Rt2ivnzvvFBi+y8U696ipNQdGA18qdowq7LD28Xe6wQnNYamE6b7vkssJygM6q5r9JaUoPlVlZV
	/ilC1atnvz6H09/PqlIVewSbHfFRHd7PFEs/DHKdolNnnc7mJ29gDgCS/HOSLXBZWd8eLVGiHZq
	zut+eqPmuTKQ0c3p7+wTjZtvVfj4JDqxRyQ6MqyMpKe1noogfWGWUoPKzku2c/VERgbm+QyHB9c
	RDui+ZiIZWmzp8oPyw4rsaWD60Obp4vhF+paDrHyykn+koVSnryp6sZrM9f5inw==
X-Received: by 2002:a05:7022:ea8d:b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b5568eebafmr23005799c88.40.1795807393508;
        Fri, 27 Nov 2026 11:23:13 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:13 -0800 (PST)
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
Subject: [PATCH net v7 7/7] ptp: ocp: match ART DPLL frequencies to selectors
Date: Fri, 27 Nov 2026 11:23:02 -0800
Message-ID: <20261127-timecard-driver-v7-7-ahmadexp@gmail.com>
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

The ART input selector named 10Mhz is recorded as 1 MHz although the
pin advertises 10 MHz. ART also advertises IRIG-B and DCF77 through
the generic capability list, but has no selectors for them.

Use 10 MHz in the ART input table. Advertise only 1 PPS and 10 MHz on
ART connectors so DPLL validation matches the available selectors.

Developed with coding-assistant support during review and validation.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 8e898d929105..3bdd6e8959fd 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -299,6 +299,11 @@ static struct dpll_pin_frequency ptp_ocp_sma_freq[] = {
 	DPLL_PIN_FREQUENCY_DCF77,
 };
 
+static struct dpll_pin_frequency ptp_ocp_art_sma_freq[] = {
+	DPLL_PIN_FREQUENCY_1PPS,
+	DPLL_PIN_FREQUENCY_10MHZ,
+};
+
 struct ptp_ocp_sma_connector {
 	enum	ptp_ocp_sma_mode mode;
 	bool	fixed_fcn;
@@ -1386,7 +1391,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 
 static const struct ocp_selector ptp_ocp_art_sma_in[] = {
 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
-	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
+	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 10000000 },
 	{ }
 };
 
@@ -3140,8 +3145,8 @@ ptp_ocp_art_sma_init(struct ptp_ocp *bp)
 		.board_label = NULL,
 		.type = DPLL_PIN_TYPE_EXT,
 		.capabilities = 0,
-		.freq_supported_num = ARRAY_SIZE(ptp_ocp_sma_freq),
-		.freq_supported = ptp_ocp_sma_freq,
+		.freq_supported_num = ARRAY_SIZE(ptp_ocp_art_sma_freq),
+		.freq_supported = ptp_ocp_art_sma_freq,
 
 	};
 	u32 reg;
-- 
2.54.0 (Apple Git-157)

