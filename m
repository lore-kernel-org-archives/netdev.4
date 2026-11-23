Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399993;
	b=bJxfjeJgdqHh6qtZhLyMhV8OXAWefAIC3cx6qkKVyX9TTgQSDAAJMVWL9jQmZ5mTO1ca
	 9UeLR2hWgk4LmMqav1rl/scr9uYc4cDggp8nue+EEdfwoDrHYVvEGrzDQ0dhLmgkhpyIq
	 d04+EjQ3lmxisJbWsO70rTGr6cEd7bpfbET9iMKburBW62xqTyRNgZYwYUdJBtTiaW+QU
	 3+q4Moy4SOW/F3Bfgd81BrO5UvTPJWQhtgfypRrQqGSYp/vWAjeaYWM+u9pFLE9MB5h0Y
	 S4pfrLaP4y2sqSXSpsz6M7HzRTHyiRtqrtV9UR4K6SuZwlKfJtF9xo6tmRynXbjwY9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399993;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=9SI+n2c6512+A1EdIq5Lcodok28cFZZsr8PIZNAkrdA=;
	b=NxGrCRqo/6cjlEpgiLio+R9TOgzoKS7pPLVd/djb8iSoRfStCqsE/WoWTxyaJUFAYe/7
	 qrsD/jjgaZYD6uptfzJTaNtiJyTTuuyvMupFjjF0sPSu48k6m2aYVxn2sZPOxDTXOAkXA
	 L5thYYhmftBR3lqx1lD242BK/+aEW5fzPap67aVifDWkoLdFOPTS1wgUy7ZsGtOqzfDkA
	 ugrn62MhMIhInYGNd1a6FADo/Z/7ZFBeqa8rzlPLe9FuiajzLWvjz01dYpwBfn/TKAn1n
	 7KhZHsCex/6P7OS3+Ev8C0/mPgj/WANOgQsw/AxDHg7LoG/81ZOZF6GAhdzyiiTco8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DF2606A334;
	Mon, 23 Nov 2026 02:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DF2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wAHAH8toQNrIvUsAg--.13131S3;
	Mon, 23 Nov 2026 10:13:01 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app1 (Coremail) with UTF8SMTPSA id yy_KCgDX5IEqoQNrg3AbAQ--.22977S4;
	Mon, 23 Nov 2026 10:12:59 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: netdev-bot+sinfo@kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: Re: [PATCH net] rxrpc: Bound the OOB challenge queue per connection
Date: Mon, 23 Nov 2026 10:12:10 +0800
Message-ID: <20261123021210.4035313-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179539668969.3294.12725722579980397053@kernel.org>
References: <20261123011320.4032340-1-linma@zju.edu.cn> <179539668969.3294.12725722579980397053@kernel.org>
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
X-CM-TRANSID:yy_KCgDX5IEqoQNrg3AbAQ--.22977S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAwsa
X-CM-DELIVERINFO: =?B?j30O/AXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGdJPZgy42BFbPP3ZIDdNx+HXlVM6AC6hNx9XryVFfQEXX3m
	WlToJ5oa2EJXAoz+GIj4DR8yxvDZtjkB7ZNk2Rtnyawr4JXcbHIjysuWxJX+/A==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Cr1j6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2
	Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjxU2Ta0DUUUU

Hi,

Found by code inspection, then reproduced with a local PoC on a Linux
7.0-rc3 KASAN/QEMU kernel.  A userspace fake RxGK peer sent 20,000
connection-level CHALLENGE packets to a client socket that had
RXRPC_MANAGE_RESPONSE set and never called recvmsg().

Unpatched, /proc/net/rxrpc/stats went from rxb=0 to rxb=20000: all
20,000 CHALLENGE skbs were retained on recvmsg_oobq (each also pinning a
connection reference).  There is no crash or KASAN report; the symptom
is unbounded skb memory retention.

With the per-connection cap applied, the same test stops at rxb=4.

Thanks,
Lin Ma

