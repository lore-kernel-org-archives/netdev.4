Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749904;
	b=gRm7UfAl9FTFbUggqPqB+qSEWdhcZvyrksBTDP/lcC1LcjuuxkCPF9oxyL9JbId2ZGft
	 n1L3mh0rr74V8ZJ+kEO/6299fH792lwhWNrdXI5IoAEF8RmMMGMsPxY4GmdmrH97y8RqM
	 ay7ycwUz+m7Pg1Qkey+oYJDoaEW/54vF4NAsYOetgm4yxkwYGNMwFDm34TRWavxAWAc5L
	 ef/2heDg6bKKuvpdL0Kv2LrVAmxur8xWa18nf0FMofotkdbNn8bRy3s1JsJ3qtQHvewZV
	 OJQVkJu8zTKHbH6xxUUvD6JeNdwzRmUg0Qna+cJxRklR3rtyFreLXlDSI1vgsL5MPFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jLp1zVgyra6q3KRMbVPlHRrPKkxKf/mkhedlT39naDM=;
	b=P06WwY5o+kyxE236c+jkXOelna7vIhy9sC4K+U+0tCou1PD1D6Wg5K8N+kA/Hxf/JKtS
	 Z/YFD+mjswH/E+uoLzeb65o+w6dvpyKfS0Oa/2khwdV8f+t8xPf50zFSny01z8r4ifCDm
	 LyvcTYjnbXeC6oSJdu9j9K6rdHdzNA4E6KXaewY74H6bqrxu3ZJGLz86fAuH3Bf9IKrZT
	 J6usFsR5EkOD9jfmN1qLHJSG1LYCv+XxY4udGpWJqvZVXEoX+prj3lQ0X4PseoLBQlRNK
	 6zDSIj/FE38oDjUpew9vTkuhVz2V4XC2pUdTnjVHfLHnoToyd1c2ZK7EmVSlV8GDVxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=(null) smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="h91Rby/1";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD3606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=h91Rby/1
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b402824d07so5041357a91.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795749887; x=1796354687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLp1zVgyra6q3KRMbVPlHRrPKkxKf/mkhedlT39naDM=;
        b=h91Rby/12MFgK2KZ9lu0UCiz7Kmqforr4tO9ZJ1bt9otY9DCHMJrCVHWj8uXVEq9fM
         KJNH3+DF/A0yumOBQL73f08gJp+2pspmR5jKknKWC2eLMDhKdSRwlRsam8fs5G2Xy5LW
         TQ0NtTFlDjwy77nqtgDCQoAo2APN0+Cngy23A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749887; x=1796354687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLp1zVgyra6q3KRMbVPlHRrPKkxKf/mkhedlT39naDM=;
        b=ChZ2DhsEx4rJuRI3aFnKiA0JYPohQGELC7x8mIhLBNvga/gDAU8vL8JQqNJtWGtvKh
         H9DqNsdAY9ZKYMIuzoM3MdqE5m2iCxAmojqcDjNs9/+4FoebV/TDMobE04wU0DJda2sZ
         ISHSvzpsRr4dSKpyqaVYezr+bNm/MizG/uYBa8CWsWZAkHXUkagnPCuK6Kt+8M4MREh2
         R7dQcmUi92uW7pWo/5Qk5dI0Bwaolm1hCsLH/vOAVYiOZF99k12yYnw+0md+FcgI5PYJ
         /n1eG/f9myEevei2aLnVGxsYBtCSwbMUrS4nm04W8wyoMCA00sIQyMTvqYUq/TXgPCXY
         rUTQ==
X-Gm-Message-State: APuU4Z9DmFbFXCa1RI/acF9Nc3JhXhetH5dQ9pWdoAtvsOB7P83hcD45
	rHewbUj4BdhLNjVl3jSHkW5NLRBDeI77piPbvlLzIVAUK0MPaUdrorDb1dh524wG4IQSrJ9sCPq
	HILnpZKXBHw==
X-Gm-Gg: AZFdTZetN7kjm8fTvBgjtACIJyNXeCjoycCaE+YTs20wn3JSImd+mTiJh5sPZLJAEMt
	8ekEqUhmS80Bpx5sWJE/Y4HzXNhB6b4CilEfHuJ8QCIpVBc9Y1GG5gQtfMc6R9MYdsa5epCvqkU
	ByRO4MVVTyEdMsW1B1QFzuzfD241jsCHdZ64gAZK4/o4ljACOXYQ2ZXlbMso4imFKfgybRmiWJZ
	qO6xvKBhtyZOrynL58q21FTsU/R+xSYP3aw2PPlLRXNYK2J+BGFGYroLmnZaGO5w49mDq70HWbQ
	zIwiZ0Iquv0SfjtcaitGljht8JCad/3Fpp8xnBVj4q8fg0/QXzneDMPB60mTOw3LhxeB0tHBq0a
	Jwhja7kKprpLMH/mGqM0w/PN4miNIOtQssVsRM2+lzerNyI8C6YIa8MKwGRg1OWln13dmNDKqNX
	APt8X1EQrFBhzzcsYZ18PfhJAMH7WQc1YCa6TLCC9hE7UanOswNcbN9ld0GUHWdqInL3uLAxgYn
	DO4e6wSZGzYaV7A6xd7C3LIzfCOMjFhO4RVSD5TbqQudppeqFya/+1vV58yCbFqG4Jnza50W+OW
	cBg2osLUAgVvbx156EiH9ANKANu+WuGx9grtlOVwoOL7jV41jONqnWRYw+rhONgpTTE0udf68dH
	xSuz6X7pvcCshDQcWaEcc1NtStwbJ+SKMms6Pn0kOV1BGNrB672BiUP8jgU03PnVJ
X-Received: by 2002:a17:90a:e705:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3b41c7e127cmr22418092a91.3.1795749887577;
        Thu, 26 Nov 2026 19:24:47 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm112521635ad.57.2026.11.26.19.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:24:47 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai
Subject: [BUG] rxrpc: stack out-of-bounds read in rxrpc_input_soft_ack_tq()
Date: Fri, 27 Nov 2026 08:54:42 +0530
Message-Id: <20261127032442.2631270-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

Hi,

A peer can make rxrpc_input_soft_ack_tq() read past a local variable on the
I/O thread's stack.  The read is 8 bytes and lands on whatever follows a
one-word bitmap.

The cause is rxrpc_seq_in_txq():

	static inline bool rxrpc_seq_in_txq(const struct rxrpc_txqueue *tq,
					    rxrpc_seq_t seq)
	{
		return (seq & (RXRPC_NR_TXQUEUE - 1)) == tq->qbase;
	}

It masks the sequence number down to the queue size and compares that with
tq->qbase, which is a whole sequence number rather than an index.  A queue
is only allocated when send_top + 1 is a multiple of RXRPC_NR_TXQUEUE
(sendmsg.c), so qbase is 0, 64, 128 and so on.  The test is therefore true
for the first queue whenever the sequence is a multiple of 64, and false
for every later queue no matter what.

The one caller is rxrpc_input_soft_ack_tq():

	if (call->tlp_serial &&
	    rxrpc_seq_in_txq(tq, call->tlp_seq) &&
	    test_bit(call->tlp_seq - tq->qbase, &new_acks))
		summary->tlp_probe_acked = true;

new_acks is a single unsigned long.  With qbase 0 and tlp_seq 64 the offset
handed to test_bit() is 64, so it reads the word after new_acks.  The
offset
is tlp_seq / 64 words, so it grows with how far the call has gone past the
first queue.

The first queue stays in the list as long as it is not fully hard-acked, so
a peer that soft-acks packets without ever advancing firstPacket keeps it
there while the call transmits past sequence 64.  The tail loss probe then
sets tlp_seq to the last transmitted sequence, and the next ACK that
reaches
the first queue does the read.  Only one bit of the value is used, so the
leak is narrow, but the read itself is out of bounds and the offset is not
fixed.

The test came in with the RACK/TLP work in 7c482665931b, which added both
the helper and its only caller, so this affects v6.14 and later.  It is
still there in mainline today.

Reproduced on 7.4.0-rc1 (63fe746a609a) with KASAN on x86_64, and on 7.3.1.
The rxrpc_tlp_probe tracepoint confirms the condition - it fires with
pq=0x40, that is sequence 64:

  BUG: KASAN: stack-out-of-bounds in rxrpc_input_soft_ack_tq+0x467/0x530
  Read of size 8 at addr ffffc9001363f848 by task krxrpcio/0/9662
   rxrpc_input_soft_ack_tq+0x467/0x530 net/rxrpc/input.c:959
   rxrpc_input_soft_acks+0x2f0/0x4d0 net/rxrpc/input.c:1014
   rxrpc_input_ack+0x6c5/0x910 net/rxrpc/input.c:1199
   rxrpc_input_call_packet+0x1db/0x250 net/rxrpc/input.c:1290
   rxrpc_input_call_event+0x16d/0xc30 net/rxrpc/call_event.c:338
   rxrpc_io_thread+0x534/0x860 net/rxrpc/io_thread.c:531
   kthread+0x26a/0x2c0 kernel/kthread.c:436
  The buggy address belongs to stack of task krxrpcio/0/9662
   and is located at offset 40 in frame:
   rxrpc_input_soft_ack_tq+0x0/0x530
  This frame has 1 object:
   [32, 40) 'new_acks'

A patch follows.  It compares the base of the queue instead, which also
makes the probe detection work for queues other than the first - at present
it is dead code there.  With it applied the same reproducer reaches
sequence 64 again and there is no report.

We found this with a syzkaller-based fuzzing harness driven by an AI tool.
The analysis above was checked by hand against the code.

Reproducer: not included here.  Documentation/process/security-bugs.rst
says a finding made with AI assistance is treated as public, and the same
paragraph says not to post the reproducer publicly.  It is a single C file,
tested, and available on request.

Thanks,
Piyus
