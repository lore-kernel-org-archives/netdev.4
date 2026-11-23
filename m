Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396446;
	b=Wmp911SZG50vBLPs98EWyZ8Tfwb8Hz3EnTuTHTkp/0kG9PDfDYz3gsjYeUg2xI6lUGBS
	 STZPu/5GKGvKCsH8EwW8KiM1tTmdDjbR1ZO41wpE3fJDU0HeIf0F79a/BRUXF5suOSpoe
	 cJgzY5FxEfXytAmevU1nHdtlfMCnu5Jv5w/LBQgPPJOeK4M3vVBVTpei/QyXGPQGQoD/E
	 yXT5ksLUdsrycLEAo01bp3AB/CLgbaJBEE8hZQ7ag8TiGgVn4M0W64VrwGFv52hwYYfof
	 IdfP04+sfcyGy28ZLnz5wgyXWV4KDApXcurhg0uwmdj6ZobbLcpdBr2v7qpDBqCuAbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396446;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=q9SQQ0vGS3CHKJ8j/JCjW1fpSMIrH3GOczh92WgrNI0=;
	b=n/HcotXasnytF1oAWddgb5wGLpBtRiPWFRYwFher+89s0CcpYZkwtUl9MEQTLFbQs3/b
	 sskJTIRyp6pOlThidYrwAdGYj3KA03O6giAuqB+oy3tCsE/It+fA2XpprdjzgvVrv3tRb
	 mKoaRLQdY/ZMWSG+7875fdA0dNBcZLYPUf5Nm4eXmiKnKAhP/OTuBr7GwGCP9WZByaV64
	 RmKC6iICrKuQ6pgyLULZIk7oquaIBp8G9oXDfs7NYysevMZZUYl9RAMISSNtvFdRs1PBi
	 wcemhHng72lWcYtjn6AF6cKRybaXoAgYly6nN28ORGGiYsvGzu+kdrwPmRZAaZhUnww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940DF606A31E;
	Mon, 23 Nov 2026 01:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wBHEn5YkwNrgc4sAg--.11185S3;
	Mon, 23 Nov 2026 09:14:01 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app3 (Coremail) with UTF8SMTPSA id zS_KCgBXY6BOkwNrma+BAQ--.24710S4;
	Mon, 23 Nov 2026 09:13:51 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: [PATCH net] rxrpc: Fix overread of short key descriptions
Date: Mon, 23 Nov 2026 09:13:02 +0800
Message-ID: <20261123011302.4032262-1-linma@zju.edu.cn>
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
X-CM-TRANSID:zS_KCgBXY6BOkwNrma+BAQ--.24710S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAosC
X-CM-DELIVERINFO: =?B?dGQvMgXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGdLDGcsJv7K8kPVYGo1dA/gYcWlr/AvKbeVnROdNmXbHqU/
	ahHZJ7fORbLq6yD3/GxawJEI+GR44huhTqccmhay0eS4avcDRRwry/5uE7d+rw==
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1rXr13Gw1DtrWxtF43Arc_yoW8Jw45pa
	98ta47Jrn5Gr43ZF1kZw4rWw1rAF48Jr17Kr18Wwn5AanagryFgrySkF4Yg3W5AFWrJr1Y
	9FWjy3srAF4UuFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
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
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU26pBDUUUU

rxrpc_read() checks whether the key description starts with "afs@" by
calling memcmp() with a length of 4.  The description is an arbitrary
NUL-terminated string supplied when the key is created and is only
required to be non-empty, so it can be as short as one character.  In
that case memcmp() reads up to two bytes past the end of the
kmemdup()'d description (which is strlen(description) + 1 bytes long).

The result of the comparison is not affected because the NUL terminator
is reached within the first four bytes, and the overread is normally
confined to the slab object, but it is still an out-of-bounds read.

Use str_has_prefix(), which stops at the NUL terminator.

Fixes: ed6dd18b5aceb ("RxRPC: Allow RxRPC keys to be read")
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/rxrpc/key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/key.c b/net/rxrpc/key.c
index cbd26da44951..019e512aeb1f 100644
--- a/net/rxrpc/key.c
+++ b/net/rxrpc/key.c
@@ -746,7 +746,7 @@ static long rxrpc_read(const struct key *key,
 	_enter("");
 
 	/* we don't know what form we should return non-AFS keys in */
-	if (memcmp(key->description, "afs@", 4) != 0)
+	if (!str_has_prefix(key->description, "afs@"))
 		return -EOPNOTSUPP;
 	cnlen = strlen(key->description + 4);
 

