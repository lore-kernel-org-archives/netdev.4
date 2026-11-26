Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705745;
	b=Nw5Ber4mx9xOAQad9srbhoAyGiwrSSP/ZFuzhb78s7azDBbtA7NW4et0ANPjqVgkFrYY
	 WPK3/6e2oDWND5FibEIxwpomUtGKVexfxikr8IW1Vr2yQ9DCOesRz7xr2C5QyXCq/EnUc
	 Ps59K8uqBR7CPyyUddwSOZEla0jTennGKCJaGF96We6UgQC7wmBjMxl8vRZhmCwORi2ML
	 0XACQH5wdT3fWFKseteQ2QibSnL2ArC+ghQvqigmGnqk1pR6ZWc51gkkzWbHZLuBoYIAh
	 ORyOY+48e3/r8+/jk4z0Nb5yFDcAKlGIo7NAoUTK7kYbrTAvEXHZoOW+V3lu1DbWC2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
	b=z/qS8UwJ8+W4/HRVqUyKSsqZTwM+Us1QQPuk905cQ8SA2hD1fWZ6O4fbJacAx9RBXoYZ
	 hHNsVedYSspl+HzMtoXfpkHX+/5Gy6/6OkkiSus6H53ZVA8WVHnTbwiwgY7RGm/BcMNm3
	 dVtBPyEXmBrCq3VbJN/yKHzom29xGpjKFPN/u2f0HwOkZpBKSDjRiNrjhKvpQQkwjmYzN
	 4j1mDRr3VQJ7FGOp8/JcsphWBJAwUwKQuf0b+HmD1UDftDlcOj8a7QISY+uUwtwDr23L5
	 lXz+ETmU6llM4e2cQfH/ffTAkwRW+x9fYICaoC4uWXXotaHxpqXUPY/lbeDQ/fKijxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B6xSaKdB;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16E606A683
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F16E606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B6xSaKdB
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so2430541a91.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705744; x=1796310544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
        b=B6xSaKdB9GurxyEl5XPkhgRx383fZevVQduVZmC86MWv382bjsTEtHbvVGgHN4Cznn
         4JSZJ81ag+eMbef5qkmG1EHTwPt1/D4GYkbNYl+b20Pv4J4wnJQGVnq40kjtElZ5UCnE
         yxT0xLW5tIIGRUC1T6ZTZzJz2XBXnuo3V4r3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705744; x=1796310544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
        b=M5rBx4gCYLqiz4pdol5WeHl7JwOu45v+MwntZt3k9m3eaWJBGFJAL7hXcfHM6QTKV0
         O5rqq9Yzows6p9bq7KJbZc37zNtcrpmTVTmaA+Dcevp/MtrXk0sLCawZGYqGBxBRF3LN
         aQ1n1NOBdNmJHmX1ulEKlwq5OtvJHkeyu/qQ+Ao01zoE5vZzmOpkGpFr5trk6t46RnQB
         ABmLIF2rNsRwL7+XtgzM/YLQHmw+/aDrl/4eff4Teeq8dzDsEZbc5QqhVkV7HtODDqxH
         0kWl3Fl3y16f0N91Grr/xvzQnB7aUReppu9RyE0OkHy/WMODFc8Bkzcn8FJFC8sp/39e
         9XdQ==
X-Gm-Message-State: APuU4Z+ctBFDElpVViaaHQxUEASzn8mK4T2yXAUjXWGC9Hov67bBgSh/
	8Q/kwrFKl+y7eGDMjlpkydHniA/aAg4YQsnN6cqtCTLWL6fyidQj67om3+Kdc0BuuyM=
X-Gm-Gg: AZFdTZdytzew/G+So/0Z8dhVHdLEtfzCxG1gvmkBp4hmcT+v+JLU82Vgvd0Xr+ziP6T
	Ej8twANa8ZvAnDAVPbhA6qlSry/WzWbhMaV//9Fb5i8Huikt4fqCPusn+e6evFPvMRAuJOcRoIf
	bp+j04cAQN4N32ikxbCsKCcEXcL9mzLHeMIOf6bDLytvvaYDg9V3lA8jL4fL+vAmGajsbY2KedR
	Ckr/vfnGX991F7ZhbzVlMcPuqPygzGmT2bv6ZMdz/r9YUsXc4pAjwIEX73E/mw4v67SuMYmqER+
	VtgmnQM04Petd9N63ivSeL3rormIk4Aza0S+Dw4TICUVtTZaoKFsGIFSuxE+G1J/g6NsqJDy75f
	0cG1payRggkIuupCEX3OxV2aYf3VDvmSvf22TqQue0zNeLqABQ2vt03TLbuRDn/bnyvnZkC1VVp
	T0kP+socy+We1LP9mtBmJv1yN9s8O58z+V52BQa62USRWaGiS50dGtwq1ZXMFGMQ24H08074fLh
	wX09/XCYMfvcsC5Uzq8tZgEitP8AnBokhcf/j1IHNPO4Im1g01GNaIFNCxLwvd9fbjZGM82LNdU
	UHuhlKlFGkjvL3HCzfFhhqdoEdlK1oi1PBrgpxdLlSp43HHpRoCKH4MyCOqqS/6liX5E320XKNJ
	82zwNwwqXw5nCJFJ3TeidD0lxvLEAPProsOacfzv3mY/nDUQ1zYJo6vRqdbtx0+Kn2pzlruxWRq
	lvB9Fhdn1F9w==
X-Received: by 2002:a17:90b:2792:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3b41c8e172amr19036608a91.8.1795705743643;
        Thu, 26 Nov 2026 07:09:03 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm34512681a91.1.2026.11.26.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:09:03 -0800 (PST)
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
Subject: Re: [PATCH net v3] net/smc: drop the connection when the peer's failover cursor is impossible
Date: Thu, 26 Nov 2026 20:38:56 +0530
Message-Id: <20261126150856.2116458-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233843@kernel.org>
References: <sashiko-outbox-233843@kernel.org>
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

Thank you - all three findings are right, and each mechanism was read in
the tree before acting on it.  v4 is posted separately.

[High] premature cursor rewind before abort check

Correct, and this is the one that mattered most.  v3 ran the check inside
the fix-up block and returned 0 from there, by which point

	smc_curs_copy(&conn->tx_curs_sent, &conn->tx_curs_fin, conn);
	smc_curs_copy(&conn->local_tx_ctrl.prod, &fin, conn);

had already run, so the connection was left with prod behind
local_rx_ctrl.cons and peer_rmbe_space still holding the credit the forged
message produced - the atomic_set() that recalculates it is below the
block I returned from.  And the tx path tests conn->killed and
local_rx_ctrl.conn_state_flags.peer_conn_abort, not out_of_sync or the
local_tx_ctrl flag v3 set, so a send under lock_sock() could reach
smc_tx_rdma_writes() before abort_work got the socket lock.

v4 validates before anything is rewound and drops the connection with the
cursors as it found them.

[High] incomplete peer consumer cursor validation

Right on all three counts.

The bound is now the bytes that were SENT and not yet confirmed - the
distance between snapshots of tx_curs_fin and tx_curs_sent - rather than
sndbuf_desc->len - sndbuf_space.  As you say, that counter covers the
PREPARED bytes, so v3 would have advanced the cursors over data still
sitting in sndbuf.

cons.count and the difference are both bounded by peer_rmbe_size now.  v3
left that to smc_curs_add()'s single subtraction, which is exactly as much
as you describe: with sndbuf_desc->len larger than peer_rmbe_size, a
difference in between passed and left prod.count outside the RMBE.  Below
peer_rmbe_size the repair is exact - prod starts at fin and the difference
is their distance, so prod lands on cons rather than behind it, which also
closes the "halts sending" case in your third point.

[Medium] false-positive abort racing tx completion

Right, and it is the same line that caused it.  smc_cdc_tx_handler()
credits sndbuf_space before updating local_tx_ctrl_fin, and
smc_switch_cursor() holds only send_lock, so an honest completion between
the two reads gave a diff computed from the pre-completion cursor and an
unconfirmed from the post-completion counter.  Comparing two cursor
differences removes the mismatch: both come from snapshots taken together,
and neither is an atomic counter the other path updates first.

Tested on 7.3.1 with KASAN; net/smc/smc_core.o builds clean.

pw-bot: cr
