Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355770;
	b=G/XcS5O5CBYLk50i63QxBUHQYaALQ0LEeuTYAWva73crQfKJLIooxqTCEXwV0838HuwA
	 HfZPegoJ5zViOXJB2BrGlWisub3Yhw4zUNAn9BOT5p2A9f4zhVJ5VAb/ilgsEvinUB8jz
	 ZSLMhUjvVDQeURNLJD0fJRGlGgZGka5RDc7E58wzgdqUEsOQrkiO0OZlCW9tSYEngYQta
	 mwEEQtEsPcOzFXoQoZf4tSHF7NehZMIegmC7huukmFNNFicCwxcHOQ98Vl2SaBr1AII8d
	 w3zmSiOf655EbcqMUOsnoSRY/8FOFfY/MFbC7sBUZQdZPKWzQv4MvoUisJIzFE6wQWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355770;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=1hVZoLQbpumNWQB/Db+U+qcRPvEbe/nKL4FLHJv3bQo=;
	b=VlscKw9JZ6KpX8sTV8vSApVwaa5DiQxJSIp6p7ev9k4LpG/A+JV7z3urjPXIiFlEYjxf
	 b1/R8NbwPEa8BcuCmJYWHg/AddNloRDCl1B+7XhtmEMUfSayeyDTf+p8YZKMN3/4+GaDz
	 HGxg4JrHlorcJRyGMXpMGo3cstAGI1yfdqEzLhFxbZRNLhuMUjTkUmV/2Hj9qLvg+0IBh
	 iOSPxEujSPBQZLlbGS9uJzkXMVoOcjgZAAY3AB3DbjdZPlrxAiPpcIJxb3Wd9wtAPK5tF
	 sFdt4XgmgUfpQ/vCqruOZ05jvCa3Alqzj6/9defCjSoKLZ1MImUscjfBuLJUO3LOewQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A663606A320;
	Sun, 22 Nov 2026 13:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A663606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wDnQX109AJravYrAg--.9476S3;
	Sun, 22 Nov 2026 21:56:04 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app4 (Coremail) with UTF8SMTPSA id zi_KCgCXZ5xy9AJrZy7rAA--.47434S4;
	Sun, 22 Nov 2026 21:56:03 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: [PATCH net] rxrpc: Fix missing lower bound in rxrpc_resend_tlp()
Date: Sun, 22 Nov 2026 21:55:15 +0800
Message-ID: <20261122135515.3989708-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:zi_KCgCXZ5xy9AJrZy7rAA--.47434S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAksO
X-CM-DELIVERINFO: =?B?9lThCwXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGd92A4lLsgoh9d9G8k0bpHiXESS7/P/JOrwuG5vkaigPSf5
	J9xy+UDTstPT+2Y2s+2sMKpJUmxLph7ArZOOW9k3qDOJcZRMuJQjBWDLCVot+w==
X-Coremail-Antispam: 1Uk129KBj93XoW7uw4DXF4kGFyxCr4fZrWrJFc_yoW8Gw1xp3
	95ArsxKF97Kr4ayFs2yws7Aw18Z3WrJryjqr18uwsak393G34I9FWxGayYgF1rCw48JrWY
	yFWYya43A3yDJrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU72NtDUUUU

The fast path in rxrpc_resend_tlp() checks that tx_transmitted is before
the end of the tail Tx queue segment, but doesn't check that it is at or
after the segment's base.  If it is below the base, the wrong slot can be
selected and rxrpc_retransmit_data() may dereference a NULL txbuf.

This can happen when rxrpc_send_data_packet() fails to allocate its wire
header after rxrpc_transmit_fresh_data() has advanced tx_qtail and tx_top
but before tx_transmitted is updated.  A subsequent TLP probe can then
enter rxrpc_resend_tlp() in that state.

Add the missing lower-bound check, matching the slower queue walk.  The
reporter triggered this at runtime.

Fixes: 7c482665931b6 ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/rxrpc/call_event.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index fec59d9338b9..4fca790a007f 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -141,6 +141,7 @@ void rxrpc_resend_tlp(struct rxrpc_call *call)
 	/* There's a chance it'll be on the tail segment of the queue. */
 	req.tq = READ_ONCE(call->tx_qtail);
 	if (req.tq &&
+	    after_eq(call->tx_transmitted, req.tq->qbase) &&
 	    before(call->tx_transmitted, req.tq->qbase + RXRPC_NR_TXQUEUE)) {
 		rxrpc_retransmit_data(call, &req);
 		return;

