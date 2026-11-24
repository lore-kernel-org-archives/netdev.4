Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532922;
	b=oV4+69vmxY1ncRd15erPs71VRXW6aGyTeMEl/CXHkrfXibzn0DgVGdCj7JFt5ef7pdu6
	 B0HV//7kfnTXaZj59NxWWvxf6lreSnKegPZO5kzBLf2vElAcSXhG9yPBeO4VktFztcLWM
	 NKkR8pTbNJmKeMCjP+CKvg6nnjnjr7jqdJV4iPVSpK3d2MF0FwTfTUlhpEW7VIBPXdFQE
	 kKYt9KstV738UPmstpCG9I74maFTzLrXsq3frK0X7zht1cIg1OXQZEp3YDTp8GR8w4YpX
	 2Q1yCpXBRXuw7DO02sVYYwUYdY9si5ZpB8+FKlIsPxXvl05uOpDh76BMwPFhXWWCMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=reEA74XZwlnOotKR58gA6rmFKPKX5xL4fy8QD9BPNy4=;
	b=K8riJP8PmPFIKectwKRRV0bqbKt9YJRoBk+JGUA6+u1s6VFQLbPWOweeNidvwkjAXGPm
	 aGdO6/3AMLQMV1PXol3ix6LeaqAjvyAasYlQfvyoIoJnvHRn4zhA9zJRT2vqsi9o54riA
	 /7pkn7ol/3U6WPRXnGwlL9MSB9a3wQpcilBTYQODUwMsez+oGCwC39iSQd9z2eJaUrgDJ
	 p873zpHiO3SCn6kj+i7EgmEo8wW0XtubbSEAedY9/rvOHj0y/MH01ywkvxeZCxhCLUu2F
	 2hXJ3M4ApW0TKn2bDBOjYrbQ5Zz1WmKz9O6UpROIr+rLGl0/Axi/wu5S4SBlMwVHdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YuEQ6pEw;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B16606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B16606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YuEQ6pEw
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3863db981d4so6375508eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532921; x=1796137721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reEA74XZwlnOotKR58gA6rmFKPKX5xL4fy8QD9BPNy4=;
        b=YuEQ6pEwoRuqaFxdKJIp6/MdJx2ZXKUzM0MNo8iEk0Teg17Gh7n4kb1tMUptOFiREA
         9oeeQHwujEMxH0TPai1mD1U7HIVzkbn48d3QDKd4sK1Ef0/TzT3RBnM3tfg2awUSFoM+
         IRB8HBBuIE8PYZVWZdiJ7JrVT6MSXrXhb9r4tnp3ObK+jvEG0Iq1C1tZGhL44MO/av/e
         V+KcxuwDwgsrTkJG/z5TfBhDgOl4FOwQiRD82CeDRFYC4fB60vXyr+SF20kbI23zV/QW
         ds3DnIEq2TC9nzOC4mSDu9K0B9Md0wdoB7ya0s9Y/QRGhhiI7byauyG/+xVks8EkcTOB
         NylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532921; x=1796137721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reEA74XZwlnOotKR58gA6rmFKPKX5xL4fy8QD9BPNy4=;
        b=d8kZ9zNJPd6eNYxs2QZsHbuKpPbB3BXBwhtlOjO1bOHH2ZJCtojdj9z8FTRbX190X/
         T7xrw96rA41tY8cLK1GFcitNiLtU/LamXaEXUg51iwM2FqaaRv/4NlTQkP3Pa+cfRxcm
         E3w5nOoov/c8xqzWeb3c0Ol7yT9OTs7qcf0lBIEVeSQ5iYgsBPrCou2BE40LTpT5aTn5
         DgRXaAf48zoIdvwnScZbiW4tYqlz45w+WTr+dV8vI8BMG+r0E/YsRViNY93t88swe/qA
         7rLkiobPmLuHHc9AExvoDnPNvOSEk6WTvrarBPPq3njeHM3ekmskezPutQakad2VSpTd
         nYgA==
X-Gm-Message-State: APuU4Z+JQ91ngeNB8+/u/Cgl5MgE85TfwJw4PB4ONzOkP68hMenKN/Hm
	Tj5CcOfJBtjE8BSHKuZI/x+E5X4kzsXhcx1ayc6O3SMKLvOujJFnmJxnVjAVh8no+Xo=
X-Gm-Gg: AZFdTZdEudI/bAG+An5KqMyN9m43Rr/YOMymL3sNNf36vdLRA8zehe/P7ti3+tFOcmW
	cw+B3tTTYRqInqk3+P0n27BZGh1/BjkbJQZQSVjCzfc9r8K2IP+SsokzrOUg1DlinsuS6sVrCRb
	e5bp/s4Dl/Im5uoKYkQnrzITlc5KzBgz+PVUNPG2Fhv3HLd5WlQV9N1D0E1Ilk4k92FiXRYVMyX
	rOC/NM/UE6AKEXITCAa41RRjE31h2OyMyqz6aLZSNuvzw9yTb9uCtH6l4sVXEqpqBA8Fd/HPYq3
	R+q7Vw+kMnA4anBY9G5RBrJhgn0Jr0xpNZkFk9KyjZPYfPLkdBHahF1DO/zZNuS4UYjqPoHRU3D
	FpE9H19w2Asfch7Ul58EBmi+40hgTtq4V8mN9Q3Kiqy6eY5d4PWtlU0Us33fkzV9+Y/4Rs8i+Pt
	zNpWmTZsmbgfrueTxeCFK/webLla/PijnXoSKC0rBy70CtB1+11GS4jIZrBYzOKWYV9C7oq7UDH
	FRbfwIPciVbsVzZ+be0rIrsOuLwHt+aPCiBkUy5eNPU2S2eLCZ1oJDS2ZcQyuVt6NzT8x273F7O
	8sVEeXWSHfs5gmRJmObe2NQSvcVcI51GP5/3FSmU1o5VYTCc3UbFxjEufQrO
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr15845090eec.33.1795532920671;
        Tue, 24 Nov 2026 07:08:40 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm3964123eec.17.2026.11.24.07.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:08:40 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	shuah@kernel.org,
	netdev-bot+sinfo@kernel.org
Subject: Re: [PATCH net v6 0/3] net: openvswitch: fix a feature leak on a failed change
Date: Tue, 24 Nov 2026 10:08:25 -0500
Message-ID: <20261124150825.1001973-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179553193708.3294.13977466604609033873@kernel.org>
References: <179553193708.3294.13977466604609033873@kernel.org>
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

Both answers, per patch.

1/3, the single read of dp->user_features:

Found by manual code inspection of how the datapath features are read:
queue_userspace_packet() decides from OVS_DP_F_UNALIGNED whether to copy
with skb_zerocopy(), and pad_packet() reads the same field again after
the copy.  The second read comes from aea0bb4f8ee5.

Not triggered.  The window needs an OVS_DP_CMD_SET to land between the
head room decision and the padding of the same upcall, which is a race I
could not turn into a deterministic test, so there is no trace to show.
What the code gives is the order of the two reads and the assert itself:
skb_put() asserts the skb is linear, and skb_zerocopy() leaves it
nonlinear when the bit is cleared between them.

2/3, the features recorded on a failed change:

Found the same way, by reading ovs_dp_change() against
ovs_dp_set_upcall_portids(), and then triggered from user space with no
privileges on the host: the datapath lives in a network namespace owned
by a user namespace, which is all CAP_NET_ADMIN there needs.

The recorded-features half has a running symptom.  On 2a324a58a084, the
parent of this series, the selftest added in 3/3 reports:

  # the rejected set changed the features
  TEST: ovsdp: failed set keeps bits                        [FAIL]

ovs-dpctl set-dp with an empty per-cpu-pids asks for the dispatch bit
along with a pids list the kernel rejects with -EINVAL, and the datapath
still reports the features that the failed request asked for.  With this
series the same command leaves the features as they were and the test
passes.

The reference half is not triggered.  A datapath that holds
TC_RECIRC_SHARING without the tc skb extension reference, then cleared,
drops a reference that was never taken, and a disable on a count of zero
warns from static_key_dec_not_one().  I did not build the sequence that
reaches it, so that part rests on the code and not on a trace.

Neither patch comes from syzbot or from a static analysis tool.  The
review that found them was done with an LLM assistant, and the
recorded-features half was then confirmed by running the new selftest
against the unfixed parent.
