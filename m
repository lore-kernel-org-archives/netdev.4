Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711337;
	b=GX0OPTheepWVXVr4Xqe2LgB3ccEaeox+0zqxD7duhJ0YptQwr9/w+lp2kcyIeEmgj3qI
	 3YT4mdPQyl8OdJMRJN+fQ8tWkCiSFLZ+KjluYu/gpjyc3pFNZ0kCxelWZdzcVmRCRXGIx
	 8f+syotm7USLcY99fQ0fbOEujqQUKfGo6eyZl532c+yjJNdNr42q+JYq/11hR4kprg5iV
	 IR64jeGwKN8PT7LJJrlT4ntECb+fzByz+z6eZUHzcpZVdXAiTnNlLfcK591rqNflY0pe0
	 S3SQd+HZzn8Ae/Zw27ZHX9aFUh7jsBFwlBYTB4+OQuj43i4ZRlYjSOs2XXDQnyMowrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lx2XW05sNsax0knyU8En50M1XVGGdhuFvjhh6fj5imM=;
	b=QPUcH3yqyTpGXXZkSsV65Y4qdMYoO/l6hrykSiawHiLbSjg10G/gTiLAR6PU6OFtuwYi
	 u31/kt6L0azOjjkW8Goktbe+03PsmQmjW+4CkFHwl0pSnpbv4Tc6hD1yI5KMmuvXX2l7m
	 1SuiWMP5Gv+Xryn/mI7Njk2GoPczy2Y2CQS4O9YQ1+Z/WgWBOjcgKM2DJlHjvqUURCOMv
	 u0yupbuf9XNMG98ZuFpgYlFocHPMCYhIxK3zna4mX/whDjcPZPFgOhaUGHaYqTS6iTLbi
	 9/rhbiuqeVdwKx9JC7Lzf4ViFEF0Q8u28o758WM91VXXAWSfEaQWQMp7ElAQE6pgNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3RiZCwq;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDA60A261E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BDA60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3RiZCwq
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so3301342eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711337; x=1796316137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx2XW05sNsax0knyU8En50M1XVGGdhuFvjhh6fj5imM=;
        b=W3RiZCwqyIIGFxFrxZwgvvoL2HNehEDD1ZGr2dUTjBFL7vmuFK8eCdKnl5Rax5iqUv
         GtSoOWAehV6JMdtkCNeqI5J7h0mzA7yBR8tQvBOux27xzI4coJ6o7qtw2ySJmW5iciRr
         AONNhf20W3ze5rcuHZoOaPwyuDhx/ik17LuSNRWXyBMAQjsa4D0mr5DWRUITp8vlABWa
         SjbVhEFpU4qTsa0czvbaHve8O3MT6KfoOsSFJOMNO3AxfXlM4OwerBSL2/33+qjJGJHa
         GL1PaW9/avySgo43BbmYEzR/las4ZHqLURkjSR0UYmYzX12iPJfQH9e0o0fbBYilAqkU
         kdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711337; x=1796316137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx2XW05sNsax0knyU8En50M1XVGGdhuFvjhh6fj5imM=;
        b=iD9qvsbPQsW4wBkA41tbr3evK1hR1cfSMi/oak3dDu4SIopgLHrzi8LgROFb8vFlrY
         DLELl7ulaLO3UhMBGQqIDx0t5C3t3Vm3V8YrqQlw4a63nlK5rGaxeLagU/k/BSEiGVmy
         RMReElqKdoMaE7eI0bo/RoZuYiyjvI1I5JLkFISh6OOX8opwxlIoMSRkP3ACAy+OPt8y
         UmFSoz3oUv8/q4iYs7KhY+QosPaJmubH74yM2wO+p+zGvcoTPeZch45+yrScTfmCDCxE
         tyJUQKj8v4Xi5H93Mp7z/igLNShE9pCHrvdNR0UVlKg0j5WCQB+3wpH15robx1gPigjS
         kBow==
X-Gm-Message-State: APuU4Z8MagNrcPJXm6kEg0vCDN3sYSMkeJrvxUyPUSZuSiJq8BRdjxpY
	FLfQo1oN7xVS1sL3EcbUDBoIYlr6w+Ji0vW/k02mrYcFYu8HtLsJmCpPHHCfg+hh
X-Gm-Gg: AZFdTZeIdhnsxSvgtZuZprURINBAKpQx2Y+oFC+3E7CYGXewYUlRv4g+BMmDczthSQt
	+wT1Y5HKY9K6VmdZlAwTsoMXWu5DJMXwgi0CodVCopTvYDOXvcLeQvb2qb81QAc2wKdubM4h6P5
	8XXEOQ1dsOie+OT5B/enq5zW44sK+Qc603wBdrrg6/33wkEgCHC4qVuPubATSizSDCINBYzEpEn
	4wNmhYuZEg9z6XETsp/dbME7TrJC2bsK1LGLJf/rmoXdWfbzYIOifYORtX54sVQiTgBFFLm8CyN
	MzSc2LVkJpEnN79B2zRAKRYJtDXaI5rM8pEdVrY/Gv1IGzUdvvYOfKWR+LmWTB1Mo1Qs/+N+KVJ
	TYas4VGgcwzpWT+yFks2TreFzv5f+TXz3xdJk5+WfrPv5UVYXoAcvzCH6cVPbsgQm8CbupJV9uW
	1A7yzEsbJ13eMPqlXLl7YsG2Lu8Ar3o7XzHAuXS83+sb3xmNktPK5zIJVIkbeOCCj6Xa8YesehN
	nPNLM6LJ7MPbQOznGbKbLjOqs4HKLB3KzV7IcK0PO7J1pThhMsnyHs2lzBN2gm9zCqcGd0Bs36b
	Ely2UDxidKVK2KRJm5ruIn1TuvugY8LL9D/xQOSLZazUq4Vzwf1fB8+Tcirkq9d6RCoUZmGFyvZ
	bgAQ853iXhuzQhcGBh0a3clTvfgq/4DZPhv3i+MblukUz0SFbRuNXbD4kks16Bn8bU9Yc3nyW
X-Received: by 2002:a05:7301:240a:b0:386:cd71:b714 with SMTP id 5a478bee46e88-386cd71ce89mr6748394eec.35.1795711336672;
        Thu, 26 Nov 2026 08:42:16 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:16 -0800 (PST)
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
Subject: [PATCH net v6 4/8] ptp: ocp: restore disabled SMA inputs when binding
Date: Thu, 26 Nov 2026 08:42:05 -0800
Message-ID: <20261126-timecard-driver-v6-4-ahmadexp@gmail.com>
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

The SMA disable state is stored in software and is lost when the driver is unbound. The hardware selector may therefore route an input after a rebind even though userspace had disabled it.

Apply the disabled state during SMA initialization so the hardware mux and software state agree after binding. This fix is independent of DPLL reporting.

A coding assistant helped validate the rebind behavior and prepare the source-derived regression test and changelog.

Fixes: b2c4f0ac53f3 ("ptp: ocp: Add ability to disable input selectors.")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 284908c6abc2..aa18c5e5eba4 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2932,6 +2932,14 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
 		reg = ioread32(&bp->sma_map1->gpio2);
 		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
 		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
+
+		for (i = 0; i < OCP_SMA_NUM; i++) {
+			reg = ptp_ocp_sma_fb_get(bp, i + 1);
+			bp->sma[i].disabled = !(reg & SMA_ENABLE);
+			/* Both buffers disabled: report None. */
+			if (bp->sma[i].disabled)
+				bp->sma[i].mode = SMA_MODE_IN;
+		}
 	}
 }
 
-- 
2.54.0 (Apple Git-157)

