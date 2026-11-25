Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641835;
	b=ofBIqeNYEA1KmGjC09Hy4iqXdHaQsG5IcXcWKX8wgmEhhYWEu/KlzsE7pqcOXUVNSk6u
	 YdNqk7zIebKCkhF27suejYC4CdJ2bOkjGWksrHNZpAwabuygkDLt3WesoogvLBcby5EUi
	 A/031WNELTKgdL7IZLXdVrFpg5t6FJKV5VhFbUq+fFeA7Z06bhDSqJ9e67Cy/Phjlh8M0
	 1GOeOZ3x7oq05Va+Zg8dRCFS1fKIN+pRnk1lzV5/VVxjSUjQ/vaYm2m8t3WQoAu7NGnPh
	 XekZBzQ2/frpN9M6cUl2NZjTA+5bN0P1dW3b6m05JSnVx5ceJ56jBUds1uFwVUoCkeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=QKko+pXC+pX05xAPyRci/aFomq2zcLLA1m2uWFlU5Uw=;
	b=pGmshEEY1F8bse75TSxmJDU7rCANwOX66Yh0RA3ZjapeQaBXgkmd58/DA1f7us3EYqnt
	 t7deaVPpq9QhfWCzwGgpp19CZomKUWilr7K/heCPU/qJhRdqcVc+MqayhDu1wuiDobKnt
	 N5rbEtAr7pAzikiOJLv7Cr+IgqdnCkUp3ms5z22aJYM5tr4ON5vsqB6sMqggFDKh+3yew
	 wSEtHOAsbt92ruZnce13uUKFh5F4KJveSzdHXL/ojD7HTziDjHDScVZ9KWDSMTwkQnsO1
	 CPIx99tzYkyDwLyBICkNqJrd7jYnlWPrrlVH/c+3i7Z5edRo3+hDIylWPt7jO2IQh1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3Q25UlT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF6F606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 21:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF6F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3Q25UlT
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso7538435d50.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:23:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641834; cv=none;
        d=google.com; s=arc-20260327;
        b=Uqq4Kds1JosAhDXPHtXu9/R34Kslhu8PrJOd2qwVz8YO0YKL9+JdsWkjB0y2q3ad4B
         wPvM5x5jxMYFtFEtP1GB7xPNbQOVWt/Qmj6yHwSqR0g5aay9xqglo53vPTLoEYr1+/5S
         4tk6kUHejTx3YoCyWB+BVYQAf0e70WCMnkKLdLIxid5e9BOqrKCjUmwIYLLWTqiwrKtZ
         2VgZMop6tp+vYUvLjfgjoFSUMfxcqShfpzFNGg0z4dcIprODDVNWjop3Z28+Cs5qT2fR
         v1o1PZoN/L1N4LY4Pcg14ReqknIuAYFXp90e6ZCBMdBMjpw4i1Bp4tz7ozkFkVk0/DRj
         Yxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QKko+pXC+pX05xAPyRci/aFomq2zcLLA1m2uWFlU5Uw=;
        fh=5rNGAAgYA48dAJss8umTpePNLX754+khJCGr/gA7G1o=;
        b=dru6mgFLi+BcuO8Ot46DtEylso8IK798VBS3K8kPvq5shhGGAYTqkki6CLx2AV0OnW
         X1Ds57TRRufMaOxST9fFsKj5gGvSVTVbIHghSYybCFXXWOIHyisDuaAZKKhpqMFEioRN
         tVNslt9INIZZE+4Vxa9OWnN1+iY/tC/gryH8nns0Qoz+VzsuVhlruXoS9UtwQ6AINCH+
         vhWCFphaYyU+n2VkSuaCn1SFb+RZVgOc8H2Cx1VJKy/FtQwMql0PB8d2o8w0iKEwkvuD
         qC5ocTZXjCJK6Ip5Rg19zAe6F6TCYCF3ti4RE6J5sc8a7xj00Hp4uv9Zcp+S8IfpDNrD
         3XBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795641834; x=1796246634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QKko+pXC+pX05xAPyRci/aFomq2zcLLA1m2uWFlU5Uw=;
        b=N3Q25UlT9yN2kbOHJIPScGS5/QwJK6A6FSO35wAyzUwdUaZ8NXUwxbVpl7tIgo+u32
         k1SuX1Bv8cLpTxFVAmKEPbKnag+y6NFPYTmUxoto0oKfcAilwN24Ww6W07hKYmpNjOpl
         DHv+EjlBfjwCCRiCG8tsmgHKPyM4gpWaeNo1qgENP9LaFnJI3UzpuVO1zqqMO5TmVihw
         HKfE9i27NdLTcTseiZACQLhuh3vdVRvMRCe8vRUhK20Keh2jN0CKq0aUT71rJgkd2iij
         L/cduBLFM0ebIVhODRitJRUC9JNI3w8qXPw/KZ6JxsPVjeOLPVhCd/I+Wf0kiXazuWgI
         iipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641834; x=1796246634;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QKko+pXC+pX05xAPyRci/aFomq2zcLLA1m2uWFlU5Uw=;
        b=Qeih1PTCheTqnGiaQcmcRvzJzCb/KbqHKwfxVZRHV9njoKHPSCCg1ot0ytlm/Qewp7
         gh0owr/daWq6biMEWfJL5X4/NKIYVP5i3UCeZp72oJzoCpaVn2kZtGEYY68vwYgHgEd+
         25UkNwpci1WuZCo2O+/34xAvz/ZLrACKTHmrDOg25mlDGdEYiGsphuAee6om8xojoXhj
         Yvm3BptKqgDlI52WuHGdLcBg1m3c7tmgACDw7qMPaXZJnphp5ZXG1InZ2Ka41mdbTbYb
         fsMu3ABvzA8/8qMeGxIdk2qDT/CqEJVee/uOMVF8MBGoG/EVv2wFCQQlqmmB6UiM8ZQi
         lkTQ==
X-Gm-Message-State: APuU4Z8vJTuXlj49LyQbU1sNn6Umu16isE2PzqBvA0T1z19iVqkwjVdU
	EYr/MGvvoHOlFU3UQ4Rq0UUadXGGnmgVVDxrNaDoNiZrT+H9pIYs0fe6p61M64fwx/Tbz/58pv8
	SUH+1Ck9vK+ROWaDva1EptyMbHAvS8E1bUJj5
X-Gm-Gg: AZFdTZeWnHoD352GjcLaDoPtjL+HHhrMmxgABLhEOjLOlpcbK2CgIaItv4xLIwMZ0zY
	B6TmYyk0EePfkcKxjHR81Wul4abZlDulnVM2X9PKCckhj7akdPFKjSPq2ReDcQsF7pqEgzhXHfp
	jdkTJqxH4FIg92eHyvl5mVGHVWYsH5uxBzclFDVfk40MceQUi0QI/WMM3//joT7nDk8UZ5b0oaK
	YdRSWHFpZwCZXEjdT23NlsIbWdWEXNLrPgKhXCtlgKmfqnFj9dTtf9t8PT8y30n6a0yOd0O5FaL
	j29Kqg0PJj9oPBrBrLvHdMV3ueo+QMDbMZWvDbWvcAmzgXCfIuUObh3+i0SZ8CRnV6syTnIfAJB
	ou4MRiOOm2bkmBxNYabUwR/OCcSwSJaTwf0lbrHYR9l4aultWhZy47T2YdSjoz5S63EzRIH5MFB
	omooci+wtaNc9NAroAZqcHW3ecGOQ0safBgnQgIZi2WaiehcueTnGxtO98B/4m3awk5XQZrwQbW
	xrHfRtNTlQ=
X-Received: by 2002:a05:690e:450e:20b0:677:c671:56f2 with SMTP id
 956f58d0204a3-67df441dae8mr4423915d50.65.1795641834308; Wed, 25 Nov 2026
 13:23:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alican YILDIZ <alicanyildiz.com@gmail.com>
Date: Wed, 25 Nov 2026 22:23:18 +0100
X-Gm-Features: Aa3M54qYaqJxZsBmVKdC9v0kHPHUF-XoVI29Nhx1OwElX5kiJFbuSHxvUKZsI_k
Message-ID: <CADFTjWSLK5FXbNgWVNpW0fSzS55P-Rm1K-JG_bA0c=DE1UbF+w@mail.gmail.com>
Subject: atlantic: AQC113CS logs "suspect GRO implementation" at link-up; LRO
 skbs without gso_size?
To: sukhdeeps@marvell.com
Cc: netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Sukhdeep,

On an onboard AQC113CS the kernel logs the "suspect GRO implementation"
warning shortly after link-up on every boot:

  [   34.531175] atlantic 0000:0b:00.0 enp11s0: atlantic: link change
old 0 new 10000
  [   34.797107] TCP: enp11s0: Driver has suspect GRO implementation,
TCP performance may be compromised.
  [   36.445010] atlantic 0000:0b:00.0 enp11s0: Enable PTP Support. 0 GPIO(s)
  [   36.445543] atlantic 0000:0b:00.0 enp11s0: atlantic: link change
old 10000 new 0
  [   44.644089] atlantic 0000:0b:00.0 enp11s0: atlantic: link change
old 0 new 10000

Setup:
- Kernel: 7.3.4-300.secureblue.1.fc45.x86_64 (Fedora 45 based distribution
  kernel; I have not tested a vanilla net tree yet)
- NIC: [1d6a:94c0] AQC113CS rev 03 on an ASUS ProArt X870E-CREATOR WIFI
  (BIOS 2301), firmware 1.3.24 (ATL2FW 1030018)
- 10GBASE-T link to a 10G router port, MTU 1500
- net.ipv4.ip_forward=1 is set at runtime (libvirt/podman), so
  large-receive-offload is "off" once the system is up

Observations:

1. ethtool -S shows non-zero hardware LRO counters since boot, although
   large-receive-offload is off at runtime:

     Queue[1] InLroPackets: 2
     Queue[3] InLroPackets: 1
     Queue[4] InLroPackets: 1
     Queue[7] InLroPackets: 1

   The counters do not increase later, including during several minutes of
   ~4 Gbit/s HTTPS traffic. My reading is that LRO is still enabled for the
   first ~2 seconds after link-up, until forwarding is enabled and the
   feature change restarts the interface (the second "Enable PTP Support"
   and the 8 s link flap above).

2. As far as I understand tcp_measure_rcv_mss() / tcp_gro_dev_warn(), the
   warning fires when a received skb has no gso_size and is larger than the
   MTU. In mainline drivers/net/ethernet/aquantia/atlantic/aq_ring.c the
   LRO path (buff->is_lro) builds a multi-descriptor skb and hands it to
   napi_gro_receive(), but I could not find where skb_shinfo(skb)->gso_size
   or gso_type is set for such skbs. So I suspect those few LRO packets
   trigger the warning, and that a host without ip_forward (LRO left on)
   would also get a wrong rcv_mss estimate for every LRO flow.

3. With LRO off and GRO and TSO on, steady-state traffic looks healthy:
   about 4.0 Gbit/s down and 4.3 Gbit/s up on the wire (16 HTTPS streams,
   line-rate limited), no TcpInCsumErrors, no TLS errors and no RX drops.

Questions:
- Should the LRO receive path set gso_size / gso_type (as other drivers do
  for hardware-aggregated skbs)?
- Is a newer firmware than 1.3.24 recommended for AQC113CS on Linux?

I can test patches on this machine and provide more data (full ethtool -S,
ethtool -k, dmesg) if useful.

Thanks
