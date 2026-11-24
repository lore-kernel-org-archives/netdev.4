Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484605;
	b=jjE7riQsuJ1hp2wz8iB+40PtMn6SXtZh/PRk+iGNELTNCkG+pCjE81SrIklh1zr6xhYz
	 X61LOCn3Wqh+1F+m2aW/HaELW6TQ9b2LrQcofOkaExMBroYMHMfWdwcmtiS+AnzTPyB7d
	 iX+mR6jJcZNQSJi2ofejzzRY+fCoGxehKTPBVj4t6FF39nrBlLUPQzyhL6sK6+8YMn6xm
	 bD4+k9BmLwGqriwJfBPIA9LJbgyLmU+Z0qLEnkVPT5g8UUViAAyihCvZY7LB+LtjaFbxN
	 zI6J3YkUuSxgUWQ/SNKIKk/v+UH5NvtSBpMftUxV0U+uZr1ZWQ/9ZBkuUbNwcd3hUQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484605;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=jrkyD4ckKisxzlyAtHxzTitUA1mJ/aXH0LLP9Ky9BdY=;
	b=gxoZP4oSC+eJqxDO5mayFy9YoSPMA5WSLMTzDKIkN1C1wiPHNOxRQOrBLn9mExqwwVAX
	 4SLxXuEG9PoanemM3eQamCdMoj8IEAASGyywWwgXQGiso6roV01JOLr8aOJyli7TQEp1F
	 xFcB9VpBCpC4bNblstBF1iZkj3aTqq/n/IYtLtUj8BvSDalUrc6nCDeEYlJdIvRQTO7bA
	 gLoRzhIhB3lZsQ7HPDDzQwhl4Ed0+uexItxNYUT8bKDAUYUAaKeWi6Zpf4JQjblW2Bs6Z
	 inkErA5O1VVQf152K7t84YREyYe/8CUKIqRcEQ4+zVmxnkL2dOMhmVR7fdu9aiQP+uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5929E606A322;
	Tue, 24 Nov 2026 01:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5929E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wA3MH+n6wRrUrkvAg--.6271S3;
	Tue, 24 Nov 2026 09:43:04 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app4 (Coremail) with UTF8SMTPSA id zi_KCgAnOaCi6wRrdtn0AA--.15511S4;
	Tue, 24 Nov 2026 09:42:59 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: netdev-bot+sashiko@kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: Re: [PATCH net] rxrpc: Fix missing lower bound in rxrpc_resend_tlp()
Date: Tue, 24 Nov 2026 09:42:08 +0800
Message-ID: <20261124014208.4145069-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179544218224.3135.17101952241323509354@kernel.org>
References: <20261122135515.3989708-1-linma@zju.edu.cn> <179544218224.3135.17101952241323509354@kernel.org>
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
X-CM-TRANSID:zi_KCgAnOaCi6wRrdtn0AA--.15511S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAA9sX
X-CM-DELIVERINFO: =?B?QZVQRwXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGedjdVxmRfghIOn9fHVZS57XVpGu+XGS3B+/7X9ScIUU+Gl
	RlgHvBPCFfoGbpgiFIvf6+PTO2ODNQDeBCya8nctNquLKLixujjCyQ7sWCspgA==
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF1DCw15tr1Dur1rAw1kJFc_yoWDXFX_Wa
	4Fk34qqw48XrW7Kwn09a1UurWSk3yUKr95JryrJr93Xa48ZFsxuF9YgrZY9w1kKrs8Krnx
	CwnYqayakw17XosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbsxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
	07jj7KsUUUUU=

Hi,

Thanks for the review.  Both points are valid.

The High issue is correct: the new lower-bound check only covers the TLP
fast path, while the root cause is that rxrpc_transmit_fresh_data()
commits tx_qtail and tx_top before rxrpc_send_data_packet() has
succeeded.  If the wire header allocation fails, tx_transmitted lags
behind, and the next iteration can index a new segment with a stale seq;
the LAST-packet case can also leave the remaining range unsent.  I will
fix the tx window state update/rollback rather than only guarding one
consumer.

The Critical issue is also real: ACKALL rotates the Tx window and frees
txbuf slots up to tx_transmitted while tx_qtail still covers them, and it
does not update acks_hard_ack, so TLP can still select a freed slot even
with the new check.  I will cover that path as well, either by keeping
the Tx window state consistent on ACKALL or by making
rxrpc_retransmit_data() tolerate a missing txbuf, and will send a v2
series.

pw-bot: cr

