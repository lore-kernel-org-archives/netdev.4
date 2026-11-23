Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399986;
	b=iXy/rRCNM8IH4sWIhg0Qbf7ExFj6teLlrAX1mn9RLrAFA+3qwczKJdiZSe1U//B9+KIv
	 QcY9lMpv34u1Z3xvUGQhMxdVXfPMOJRbA7VfgFfAUrRA8YO9j6k4w+AIEWB6PewCXkCSf
	 MOu6wW49klqyIBBFVMNGFYZkdF2ohwgolpEkQKlqS+Unbl8/e3J8ol9cOSpHzxzPncAWu
	 dJDeAc2ivEhBkNxZ5Mmxa4FQj9wgmZE6ablyQc9UH2AyGYUdHDfAss01QvRY02D0QkIqC
	 SHaZMqXCiAz0kZhQBTiMxFX2DXhWU9vuPFvVkJjpplkq5oLq/efUGKtuvc3xU2dznog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399986;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=7WNllSuoY628fVV8UwqSTdUaKi0NxXh2fFQ5nKQfqWo=;
	b=pRoOK1mTAQcURY/+oBd2aAJuHNpywi8YewGUPIkXbX4rygyyjXC6VcEV7EgN76QR8Rfy
	 4xlNaijAwBiCG3BCoyOEsRi+nu680b/6YFQiOZyrwsa1sg3uvWa2nBxz8OGRu7TWPQCVc
	 E1KAUz+2EVAX58oVRbX4uuYNJrYIGVutnCRy1FrP7X4EzR7Wdg60ilMUQpvMuqPntejFm
	 ogeAnS9ner9zqulkBgDfyL39lRnPpUrvtMwVBPo5hyRYUPOmra7IWmpW0BfGR+bOM1hHA
	 qcJlaur8IXfq0U2CfsKUDPosDp+46W/h+Z4LLxfZ2YApnxESCGtlXu7J3BYh4V3UO6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADA0606A31A;
	Mon, 23 Nov 2026 02:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wA3ITcqoQNrD_UsAg--.13525S3;
	Mon, 23 Nov 2026 10:12:59 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app1 (Coremail) with UTF8SMTPSA id yy_KCgCHmIUioQNrZnAbAQ--.21654S4;
	Mon, 23 Nov 2026 10:12:52 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: netdev-bot+sinfo@kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: Re: [PATCH net] rxrpc: Fix overread of short key descriptions
Date: Mon, 23 Nov 2026 10:12:01 +0800
Message-ID: <20261123021202.4035298-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179539668255.3294.13468714473453034116@kernel.org>
References: <20261123011302.4032262-1-linma@zju.edu.cn> <179539668255.3294.13468714473453034116@kernel.org>
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
X-CM-TRANSID:yy_KCgCHmIUioQNrZnAbAQ--.21654S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAusE
X-CM-DELIVERINFO: =?B?3oN7rQXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGdboVYov/USHyHXOYpqKPIbbAN6FzyV0VTnaiIk7dV95xXK
	10ImVjZal0gRq8it5oLTkR6P8W9CrxruHxbQKN8qIfynaGlLQxuCfIQ6UICXEQ==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Cr1j6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2
	Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjxU7xwIDUUUU

Hi,

Found by code inspection/static analysis while auditing rxrpc key
handling.  I did exercise the path at runtime: add_key("rxrpc", "a",
NULL, 0, ...) followed by keyctl_read() reaches the
memcmp(key->description, "afs@", 4) and returns -EOPNOTSUPP.

It is only a C-level overread: kmalloc rounds the 2-byte description up
to an 8-byte object, the inlined 4-byte load is not KASAN-instrumented,
and the extra bytes are slab padding.  There is no crash, no KASAN
report and no user-visible effect, so this is a small correctness/UB
fix rather than a runtime-triggered bug.

Thanks,
Lin Ma

