Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206583;
	b=YWurQ5LyoUTeN3fu9Mv40b2Hcdp/YDTHvtxKUhY7W66QS8tub+7PL3x9Vh8hV10RUs4o
	 uh4VmkQzen25FatHBSQ3HRgcUdRmvy8AuETCrh2QK/55E3+XC/zob5X1RbWjpRsoc8Xaf
	 vjucRSqgSQS5w9W9C4yoc6NXbkpEgCuiU++om9rYv955YMhbYaWJ/ZoD9vusHyVXSinKS
	 zbOV9BjjxHmRpUA81OpfT0lt8r2ZvYshjyorm/tHwFNH55InVR4FXuyVKqHRWobS3/zxH
	 QQfieTzKkAJwnCgKihszExYdmOWetIRprDEDTm/aCZokb1Es7DDipiBQ33v1f+v7W6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206583;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=hAknXHv/4i/SWTpoyAcIjrvHEB5Ii1/3j5H4a+yyAJ4=;
	b=aQmHfduMkDR9YM5sxoJZC3XuAZJ8nwqdr0NysBnvjqrTCx0AAZ7+FumEp+KEgn5SJbit
	 +fD39MY5cDA5UZepG72zWQAzW4SCZ4iAIzFoAbN9gWMaWzhQnYUZeraMoB6WQ3eLUJriN
	 NfDbC/J2Yh/5BLlpjvoho2KaXZP+h9lTe/cqyIna8SERfgnhEwaMitoxgEA094EzPt4J7
	 WRUkO4EAGPbzsr2LkewSVMJIAEQjx117lOpL/ur4RehaGlfaeOjnXIRDNgbzLoZCt3Pvo
	 BmSLL30Y02M5oZhaJN/OlG+t9VmVo1Bm5FGDIpBmeJ2iaIgFMn5xfBTUoxvHJExwt9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=j0hnwgwK;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC27606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC27606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=j0hnwgwK
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FE381D86DDA;
	Fri, 20 Nov 2026 21:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795206579; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hAknXHv/4i/SWTpoyAcIjrvHEB5Ii1/3j5H4a+yyAJ4=;
	b=j0hnwgwK7jTY3u1wdtWCuKCgPZt4poc0eG3y2vs7T5fGAqiNZfKCXgIsZC+eh+maUUxfXz
	gpjbwEzXXdO6olEQgvKY4OgIzeCptQ6DOAgnnj4iIybUzd06Q+AXEgYEYT1gX4l86N6M6L
	UvMLiciDRBed+y4YbsPkuazjXC8OA0u2aPPdnkEcKqNdO7Y/vhyb3I1T9bBo4JSFdUPA2w
	vYJ2WOknx10voaPVsA0LtQuGzROp5CQEXatBfqqafCMVYZl+t0MRxbhplqvflsmjnTRkea
	n3UPIOuiIT5t0z/HgGqZE9FjWPDs6IWGNvH80ZGi3KYDonlshR0IPYijcEs2Lg==
From: Michael Auer <mick@yoxcu.de>
To: Alex Elder <elder@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH net-next] net: ipa: report TX_SUSPEND wakeups to the PM core
Date: Fri, 20 Nov 2026 21:29:30 +0100
Message-ID: <20261120202930.345970-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
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
X-Last-TLS-Session-Version: TLSv1.3

Since commit 4b2274d3811a ("net: ipa: don't bother aborting system
resume") the IPA driver reports no wakeup event. The IPA interrupt
still wakes the system, but the wakeup source of the IPA device does
not count it, so only /sys/power/pm_wakeup_irq shows the cause.

User space that reads the wakeup sources cannot attribute a mobile
data wakeup. Plasma's powerdevil, for example, turns the display on
for every such wakeup.

Report a wakeup event when handling the TX_SUSPEND interrupt. This is
pm_wakeup_event(), not a hard wakeup, so it does not abort a suspend
in progress unless user space uses /sys/power/wakeup_count.

Found and tested on a OnePlus 6 (SDM845, IPA v3.5.1): a push message
over LTE wakes the phone from s2idle, and the IPA wakeup source now
counts it.

Signed-off-by: Michael Auer <mick@yoxcu.de>
---
Tested on a OnePlus 6 with an sdm845-mainline 7.1-rc1 based kernel, in
daily use since late September. On net-next it was only build tested
(W=1, arm64 and x86_64 allmodconfig).

The event is also counted when TX_SUSPEND fires after a runtime
suspend while the system is running. If that is not wanted, the call
could be limited to system resume. I kept the version I tested.

Tool use: the analysis, the code and the commit messages were
written with an LLM coding assistant (Claude Code). I reviewed all
of it and tested it on my phone as described above.

 drivers/net/ipa/ipa_interrupt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 766b094eb069..547ed67930d6 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -92,6 +92,11 @@ static void ipa_interrupt_process(struct ipa_interrupt *interrupt, u32 irq_id)
 		break;
 
 	case IPA_IRQ_TX_SUSPEND:
+		/* Data arrived for a suspended endpoint. Report it as a
+		 * wakeup event, so user space can see what woke the system.
+		 */
+		pm_wakeup_event(ipa->dev, 0);
+
 		/* Clearing the SUSPEND_TX interrupt also clears the
 		 * register that tells us which suspended endpoint(s)
 		 * caused the interrupt, so defer clearing until after

base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.43.0

