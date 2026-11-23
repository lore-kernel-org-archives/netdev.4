Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405291;
	b=SwduPoLoE1NYK8zAlSSmFjKQG+C8ZVbXu4P5oDYBk+K7eN42Ykwv26ValVGRwRd7V7gU
	 elnvdKv1ULbDjJbyfBqIOzD+iw8VeX9XcA7s8zCrRt+eQTpUNDuksR36EaBHmPj7JWf23
	 VtwrFQs8MIQIHI8dFPlF8g9JXfZlLZ1TwdnGusaAEFwZgksJrTXeTOoIZ2QRe/8UMP3D8
	 Ja6QFhv0CNt23B+zu0fym/EFunY1sfmlTRKZOD4oSE13+3uF6f3xkONrP0d/1a6+IvlUM
	 espew2XvHVS9Tk6WmQdI0BfVevj8nB+RmkxMKO6HpwKeWrYdd5din2VVPMKPl395Y/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405291;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=azLotfhPz62cI6ap9RyhSVO5lLTwfrHkxru9oRkeOnA=;
	b=Yhr3iElMf3d4+OWHZ5QZaNFWzygNU/OtnsuVxUjCSSbYA+5CTbMKWTVenlqbRtTv/rFX
	 tWIqv5SK5vhDwx0wi7LL8EZEtHWHXMMPIvHN2AWeOf+KY6XliNIqTc/MF4BCH1VlLNKCG
	 0RURa9deDyqhLoS/kgKpTz7sTGi/Y8QBiWUbI7+DtQCP2ybYSX+W5qK5ZqybGWkycX8Ll
	 vZwX7jPJH4zYBJ4Ncbdse5+k2wzMPIrMC0a2xu6gx0mLcN7/9QAd5dpSfIxl+Y0htwzyn
	 EIHgmtOOVu2hLRS2JgP/S6NhlfIAcvZ0rawitSB9op1CWAtYNUUG0sBixPb04zXxJjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F01606A31A;
	Mon, 23 Nov 2026 03:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wBXQT_jtQNrujQtAg--.206S3;
	Mon, 23 Nov 2026 11:41:24 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app2 (Coremail) with UTF8SMTPSA id zC_KCgCn_XvftQNrPGoFAQ--.43947S4;
	Mon, 23 Nov 2026 11:41:20 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: netdev-bot+sinfo@kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: Re: [PATCH net] rxrpc: Fix missing lower bound in rxrpc_resend_tlp()
Date: Mon, 23 Nov 2026 11:40:31 +0800
Message-ID: <20261123034031.4039623-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179535620364.3294.15218868114054377349@kernel.org>
References: <20261122135515.3989708-1-linma@zju.edu.cn> <179535620364.3294.15218868114054377349@kernel.org>
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
X-CM-TRANSID:zC_KCgCn_XvftQNrPGoFAQ--.43947S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAysY
X-CM-DELIVERINFO: =?B?BE6+LgXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGcJgL4JeUGI23A+VlFyLKqioogTwNHZZ/No11c6+1MrpssW
	4zTpECUvEJiCCFcCXeDkI+McodZ3My3mpEjY9W5swLa7aL9TrYPqQporRIXIRw==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48Icx
	kI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU801v3UUUUU==

Hi,

Found by code inspection while reviewing the RACK/TLP retransmission
path, then reproduced on a KASAN kernel.

The symptom is a KASAN null-ptr-deref in the
rxrpc_resend_tlp() -> rxrpc_retransmit_data() path: a write of size 4 to
NULL+0x24 (txb->flags |= RXRPC_TXBUF_RESENT), because the TLP fast path
selects a slot below the tail queue segment's base.  That happens when
rxrpc_transmit_fresh_data() advances tx_qtail/tx_top and
rxrpc_send_data_packet() then fails to allocate its wire header before
tx_transmitted is updated.

Thanks,
Lin Ma

