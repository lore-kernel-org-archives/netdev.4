Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054308;
	b=QxEYvrkiSHscE5v6h14NmwBS2VsjIm0BEVm1nkbQiwnbJZFH/b8KV287WbK/Ey46Okep
	 1YcCzlJ9Ee2E98cP8LYu6gznL/5kwJVmi37g3THeLHA07f0oNY6vAjsvLaAqfBduFbhKr
	 hJwK1s6J4k51Uj4wi30ZrZKWnBmpWZKhxb6JUnsIAY9+kTRazQFBVQg7AXDb7fxY36tEd
	 /4Gb/w72Zfz69cxzxdYW/PEntbDrWbhN0Jjv9DbF6stl42uXPbARYGeWuQshmarPT2utI
	 e2cZxdm0xmtHHHUhFC62Iw/oMZ+HCX0gJtHFGqQU2hJ7kEg9+gqyjj/t7uToPbnnhKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054308;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=I7umKs4ojZyRjYW4oSjGu4qFhEDe6jxTq5oypeT9h3s=;
	b=eMJy3Vih1o1gUATiEy4kDJ9bfxuSLV7O4Uz9N4X9A+6Whi0SuZBJ7iDkxvc9XG+pMynd
	 c5S71oCgVcZ6Xx72MJadelu0QpcBPjxYNlgeb9L0DreJESUHjXT+yg9sd8XjwCbw5bqzH
	 HXqhxfCR7ZEpdH47AdAGFPPvBzSbP8Z8Wf3ZXWPzMQvaF0q1zEry+qMuatV7T6wH6aTQz
	 5AC2mjnmp3ckHWGV4mqJxhsaw3U61v/pqhQoLkmmu7Jo67zjmp6vIuAndO+IugwxwJmWs
	 1R/L2/aU6tnNTHbRxQqKbiuY1di8L8qNj/uTWztr4IlPZIy+mXMckBSv9tUKcBav+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7915B606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7915B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wDnlSrdWv5qbOciAg--.2050S3;
	Thu, 19 Nov 2026 10:11:42 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app4 (Coremail) with UTF8SMTPSA id zi_KCgCHV5zcWv5qw0jYAA--.5105S4;
	Thu, 19 Nov 2026 10:11:41 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@infradead.org
Subject: Re: [PATCH] net: rxrpc: Release challenge connection ref on abort
Date: Thu, 19 Nov 2026 10:10:58 +0800
Message-ID: <20261119021058.1014099-1-linma@zju.edu.cn>
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
X-CM-TRANSID:zi_KCgCHV5zcWv5qw0jYAA--.5105S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAUs+
X-CM-DELIVERINFO: =?B?1wfkkwXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGdBUsqc4g38TSJC+UbjERjO6W65mNpu/0oK+bQLVOwV3yPn
	QMd5hkOFfLpjV6RTGtPkFJfuYRpl2X1e0ghaNI0EmPp0mJ8ReaOl296GDLAGXw==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
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
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIF
	yTuYvjxU26pBDUUUU

Hi,

This was found with LLM-assisted manual code inspection.

An independent Linux 7.0-rc3 QEMU benchmark run reproduced the issue.  The
trace showed the missing connection reference release, with the connection
refcount remaining at 1.

Thanks,
Lin

