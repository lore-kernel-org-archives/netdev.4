Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705594;
	b=k5PJ8jujLYN8FfHSkvvzQqIFCpapkfWhWO1u8KETVyIbhoWhUR2lN5iLNOd8pcwQHoO9
	 ueGhqmxHnTH/Sz0A1Si5LocdFq9j/TQSbDSX7pL1xWSYosRa54uTAvnm92b6hDELwFqUQ
	 M/l29WItbPTptNVMEjBjNKZ9ChEGpavkQkYwcVUGQR/Flu7AynwSKBD3vqq95bC0QK1+I
	 JDHUWmOvSm7UyQra3+o0jHHoOSCr6PXo7/vjBc74zmKi2AGsIHgi6LyMcOi4/EOhv3BQV
	 GLDFFpkJvpbhc5wz/0d0yAgXnVfJMieWxCijzuSD+UmdVw/qD8Ka4Xo4q6DeTKFMf5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
	b=ro2dWQNSjvf4G9LxeLCz/49tT25AxbHav1iB7kCzmz+RdjKPHt0AQ66RGhXNfUL1gSdb
	 YaM9WRXGNE82X5AbuxBRnWDRbnxbf3ZOlGaJ7nfutpcKSLsLEODOl8L7D8T7SPWoZ4ChN
	 47JR1/yhpBxxbV5h640tG7g/7gqc9Yo01s/t9QBnceo4bYYgYBcsYbETZ2l7nW+iBwpYi
	 r6LDxOaNgdLtbswRDHIXq2N9gD9tzcxtTctMrWnuTeh0FtshOKhu4yqNFNFACutAKLepg
	 hoBKajxPuS/abgF2jAd/whSvtB1KFQaI9ZYdllSYg2G+0gynUelRIamTKSJF5twcpmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cyj1fHpi;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214C606A685
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8214C606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cyj1fHpi
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc751eddf25so4567265a12.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705593; x=1796310393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
        b=cyj1fHpignlDujJCnViGY8sX6x8wogPXBpBDbUr/XIdmWpWrKtxMFMMCszkNH5KK9U
         C41GxztehbjKMlbgmqYxIdLHn2VzjSTutkCUPcqXt+TEJt64BDjWklhaWCq3SZDfnOX6
         KmhhKc5hkKYtcCSsx4GDGusu3eAXwjUr5s5bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705593; x=1796310393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
        b=yadDj3nxXT9lU65gX6MLkC3Qzfj4IQViupjxzggXLLJMBlxhsKvWkwDg1zy7yG0Epz
         VFJr2dtJpUnu9NMgnfh5NjzEPI8IXfidvPGOtMXOr2QAiokIBkDKmjtwwJSaeOCTiZvS
         yZaVa6vewz2aqL4MYjhbchZceui8WGk/eUFSYcDsT0MEo13XIEaBRO0BSJJEQoF6lzBk
         BCpTAqb3mgRVl3m1/rkg0/MB04TpmsGiEiays+t51KITMQuLNw1VZJ1s9F6BNCDzDnIy
         uzTG5+dK7m6BQ98uny7AKBrptLDL8JgsDau8tR7YKkYIE3lj9czowrfz5igguPY3+txg
         cMXQ==
X-Gm-Message-State: APuU4Z8g/DxCfgjBYbtbkZkwc+Wqr+iGD9I3iqkvHw7ovIzEkfm8btSP
	fj1hmk0GbYY2USwUW9Mphsb/7w5HFuQtMprzc92LrycMbDDOS0AbPXmztqW9iPVOhbE=
X-Gm-Gg: AZFdTZeebmj4c/MSYBqOFdrjJYarsy524tQEJcRZhzLynQYxZkB7V4hlNmYC73hoQW4
	WUNvxmgmiZALTd1fj0/pGKVIbf/GmQXps++Pe4/PuPyF4Nx+k0GFdIux94e9JRnOIc4UNRRYEQu
	TjBxz+WMva5REaWTmxqRB+BhNtTFFPc3lieuRslbeurzs7Dgn1lsqDFYsYkGnMWD3tpHd357i1e
	8L5StxT2yzm629ZgRo4WTwAIwF5098Awwd921wNW/GTaNhCNXg9wosbUEmNYzRqTpUEIazxAQMn
	XDNp/4ad12jn8iKiHwfz773oqRzLZV1jH/7vc8cpVmsu81cKg38X96fQZOAqq73KoKQCuBFggcW
	rQEogSKdbxNx8yKrvV8H0c/jZaF57mOadXOT5TTFoamlOYF6UUBHTsb+CXxsQgdcGGw8kEQMyzh
	/IXR1UMOLlFnfAxtC8CT5iE2FAyBGAER5L+6CU3cQXRYtxv+aDkRz8IcgJh/PYuhrqn/ozagOj2
	iDVVcuJHR8c1YJCc8pXgH+SPq2SzMebm0NJ3Y88F5QruRmLzF8bP3J5ErYdCnsyeRKPlBl2gufh
	WgMsPizjzLORR3fTY1Tezf8KifRi1eytlk9RlC/1H+SDcaoRHVL30VbqDfqWCRN87QXyU4PH3tu
	WHxTaK38hZnEAEg5alsnkI0loMiaFwQtte59qC80LBYX6ZzjkOgPKrvHrdIMEwA1/cA==
X-Received: by 2002:a17:90b:48d0:b0:3b3:b5b8:1f43 with SMTP id 98e67ed59e1d1-3b41c97115amr22991604a91.62.1795705592804;
        Thu, 26 Nov 2026 07:06:32 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm8039585a12.10.2026.11.26.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:06:32 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com
Cc: netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kapil@presceralabs.ai,
	stable@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net v3] net/smc: bound the DMB-nocopy send-buffer credit by what was sent
Date: Thu, 26 Nov 2026 20:36:25 +0530
Message-Id: <20261126150625.2113302-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233892@kernel.org>
References: <sashiko-outbox-233892@kernel.org>
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

Thank you - the finding is right on both halves, and the remedy is the one
you name.  v4 is posted separately.

[Medium] torn cursor read and non-atomic update in
         smc_cdc_msg_recv_action()

Confirmed.  smc_curs_diff() reads wrap and count with plain loads:

	if (old->wrap != new->wrap)
		return max_t(int, 0, ((size - old->count) + new->count));

and this path runs in a tasklet under bh_lock_sock(), which does not
exclude smc_tx_rdma_writes() advancing conn->tx_curs_sent under
conn->send_lock.  So passing &conn->tx_curs_sent in place can pair a
pre-wrap wrap with a post-wrap count, exactly as your interleaving shows.
Both outcomes you describe follow: the difference collapses to zero and
the credit is lost after local_rx_ctrl.cons has already moved, or it
exceeds sndbuf_desc->len and the bound does nothing.

The second half is right as well.  smc_curs_add() is

	curs->count += value;
	if (curs->count >= size) {
		curs->wrap++;
		curs->count -= size;
	}

so in place it sets count and then wrap with plain stores and transiently
leaves count >= sndbuf_desc->len, where the code it replaced wrote the
cursor with a single atomic64 store through smc_curs_copy().

v4 does what you suggest, and what smc_tx_prepared_sends() already does
here: it snapshots both cursors with smc_curs_copy(), computes both
differences from the snapshots, advances the local copy of tx_curs_fin and
writes it back with smc_curs_copy().  The cursor update is one atomic
64-bit write again and neither read can tear.

One note for the record: the torn read is not only in the line v3 added.
The diff_tx computation read &conn->tx_curs_fin in place before this
series, and the snapshot closes that too.

What is bounded, and the bound itself, are unchanged from v3.

Tested on 7.3.1 with KASAN; net/smc/smc_cdc.o builds clean at W=1.

pw-bot: cr
