Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059970;
	b=PuSUJtsLopsoV46iRGdzI/N20G6InWjXeRLQlZT0kQ2Vscv7IghzWJ1kRCWVPtNk4krF
	 Y219ICnkArVKf8V39dmxCZE/ntnEo0FquVGqdLtRnH+vNgQW2iFvqTzBT+oaBp5vtZkTD
	 s8tCiQ4Fs058jwB5uLXc2pXtVOts2kdChFMiZTuD1LaPmsSNqHKtRnRgYfkH6cXnvHY+q
	 95ln7T+PZ1XTMNaHKg8gwcuZ+hkjPRv69WJKFqfPviAantXjckzDBOYMXFeb8XaQ7KM/R
	 pKZxLuvXS8gxdGAV5APRDmyy56bRc7B4mE2HWcfWAxnyZF/RncrVy/3JVhYMZj2M7ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059970;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=8QcXhpi7yEci8c2/TVVRIJK0h6/KhpDAAlCKtLz8KQQ=;
	b=xFITEOX4Ff1KMMKVTlrZMfX4mvsxS+CKw6znpqBBCvPK5VBwfyPvsxGOtjjaarMe4qSc
	 mJY+klcn3a8aR9LDqHX6MghwZEMmCTAkSLet1YTrOhH+4QrI2i9x4AuOBIgcjEZuj8tAm
	 DGNKag5P3Urc59FwnJ1+VIIiu//MOFgbAtM+SunJLZpVg44IdfGwl32Kz4t5Mv93O9pqK
	 qVBjlAN9zB/M2gqQQpe4F8yTNsFjv1vgZXANycbZRVznzjaAovvDP9gccqXLV5QUBnPCx
	 Nm/H/XQAErdIWyM/IucXsoHeK3cdsAMld4M5VdChaYLLFT2kyGCjXJFjbObcGZ28lDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DA4606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DA4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wDX7jT1cP5q9jIjAg--.2749S3;
	Thu, 19 Nov 2026 11:45:59 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app4 (Coremail) with UTF8SMTPSA id zi_KCgDHBpv0cP5qwILYAA--.48052S4;
	Thu, 19 Nov 2026 11:45:57 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [PATCH] net: rxrpc: Reject previous RxGK key at key zero
Date: Thu, 19 Nov 2026 11:45:14 +0800
Message-ID: <20261119034514.1019830-1-linma@zju.edu.cn>
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
X-CM-TRANSID:zi_KCgDHBpv0cP5qwILYAA--.48052S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAZsz
X-CM-DELIVERINFO: =?B?tEhTngXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGerhwLqVh2elSpnTQIpLwR+84BRzbtXNWxQDsJYbJXO77pt
	JDlmLrO2jQlFg4McTJhyTLNdil2Tf8rCclWM3oKX81b09fO53Ay++Shlfnq4rQ==
X-Coremail-Antispam: 1Uk129KBj93XoW7tw43Xw1rKFWfXw4rCr4UGFX_yoW8tr1Upr
	WFkas5A348GF47Jr1UXa1jg3WYkaykKFW2gF1Du3yfJr4ktay5t3WkKrWjkryjvwn5Xw1j
	vryvq3s8K3ZFvFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8VMKtUUUUU==

rxgk_get_key() and rxgk_rekey() compare the wire key number with the low
16 bits of current_key - 1 without checking that current_key is nonzero.
On a new connection, cksum 0xffff therefore selects UINT_MAX as the key
number.

The missing key slot makes rxgk_rekey() derive a new context from keys[0]
and overwrite that slot with crank false, losing the reference to the
original context and leaving the connection with the wrong key state.

We verified the path using a real AF_RXRPC client and a raw UDP server that
sent a DATA packet with cksum 0xffff.  The run reported five suspected
leaks; two objects had an allocation backtrace through
rxgk_generate_transport_key(), rxgk_get_key() and
rxgk_verify_packet().  The slot overwrite and lost context reference are
established by the source-level ownership analysis.

Reject the previous-key match while current_key is zero.

Fixes: 7a7513a3081c ("rxrpc: rxgk: Implement connection rekeying")
Assisted-by: Codex:GPT-6 <codex@openai.com>
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/rxrpc/rxgk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
index f9f5a2dc62ed..0a62475691f7 100644
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -100,7 +100,8 @@ static struct rxgk_context *rxgk_rekey(struct rxrpc_connection *conn,
 	} else {
 		if (*specific_key_number == (u16)current_key)
 			key_number = current_key;
-		else if (*specific_key_number == (u16)(current_key - 1))
+		else if (current_key > 0 &&
+			 *specific_key_number == (u16)(current_key - 1))
 			key_number = current_key - 1;
 		else if (*specific_key_number == (u16)(current_key + 1))
 			goto crank_window;
@@ -185,7 +186,8 @@ static struct rxgk_context *rxgk_get_key(struct rxrpc_connection *conn,
 		 */
 		if (*specific_key_number == (u16)current_key)
 			key_number = current_key;
-		else if (*specific_key_number == (u16)(current_key - 1))
+		else if (current_key > 0 &&
+			 *specific_key_number == (u16)(current_key - 1))
 			key_number = current_key - 1;
 		else if (*specific_key_number == (u16)(current_key + 1))
 			goto rekey;
-- 
2.56.1

