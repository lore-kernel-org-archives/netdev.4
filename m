Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560607;
	b=GC1cumfZ9wdDRv/iIzrUC1B3ysnQ3OfrREWJftieXC7c0pVKAulyAJs9t1PPhiZ0IE5N
	 edidq41QvBJxFrrk4r09aQ1WSdcUluhASEP2scPV52Brq7h+Xp8M1Z7Ig1qUqlCfYsTg0
	 CWIUzDM3IVx3YE49koy0HUHFW3XNdky9+akU5jeoQULbjZ0KAoD+uhFyDU12KIHg5W3i4
	 L91585zI9kb1O0Cj+AQbgsa2MeWYyg2JlRMRMzhexRYCo4ugu1bsS3Hs/DXqUcbHEIR74
	 q1Tf1Z/Lx7YcCLAcEXkvrQlnD8A8r9oq/eTpGw21uM7xqU9c3YgEDdPADNfPbkJAD/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MiFlYS5QM/ZCFScVScCG0noWBLQHV/SItrBbHD8+bCs=;
	b=1cYEtnq2Xy7UiVcr0jkg0KSoYFsa0UkRRuGAw9UOXt4xUeEfRaumfNifDnI+TuQEoTpp
	 /yOb1CjH4BvY+p7igXNmdeIOzVCRKoTWDqTLJA0TlwJ0VCn4HzDWO9DenCiLn03qsmg6F
	 C+dbuxkeL8dkWQxMIQb3awkRCtLrAvN5zAU4OZRP6sb5uDJ9cLAB15JoECDHU93JPcIAc
	 bkIJFKv9uq4sw+pZBke+avkFSrAdvfHiCNQfMcgIZ7IGdPvZebzc3OTGCLV0P514h7e05
	 vUlTp9CvekSDAFmcEg3nu3aQmGizbiHP/NmAM6IcR8Mh6spUfufKO7bohFIwVZ4BANA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neYw5Gf5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B0606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neYw5Gf5
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b89399d92cso836622a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795560605; cv=none;
        d=google.com; s=arc-20260327;
        b=I3bsD0rLLv5mYsM0zJS6o0AD/Umyy3IknHGgkoPtjkVzP1AHSiSClfBad8s0PrVrfX
         HOLYjRN64hZJbzxvslKAa6QBmYeHaUKGRv2J7qt7sCzaw1FRO9lL8Iu971IpgaJj/oXt
         4SdY41ENNOE/vf/c2yrWjX5hca+7vN6GsZ0F0psyK/HUpUe12G+ul92F/Kns1x0+bmP2
         rnQxNgu13ftl22nYWHBfc0+rSxIrKcFxXUk4Gal0VqIpICfmxjNKUOce6ULjMnavLxiS
         0Kf2kPKAcXPgqhqKoqRN94Pe4ZZDBt/PhrWjqUYvucyVb29752RHjMHzOZVZFp83yssl
         jX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=MiFlYS5QM/ZCFScVScCG0noWBLQHV/SItrBbHD8+bCs=;
        fh=aDUZZ9N6NPmO6DMPx8G1ADwl9DVnQFUvUJ2oivftvxg=;
        b=HMj0C447/M1j6pQVUjDP2nrPlKbaB/FD/WB6qZx5yFfuF5DZ4pYnjENrhjb9VyFoMk
         5YvsFCyQ8X5Qd+EHtILg1gobo/ddJpe+csYvtu0GGrVzkxDeGTc03rhr0PzjYyUaOgom
         coei06JkHHqNfH6m93O53thWft6NxKB3JX8rHCODHdQn2jj+8ggVgQdB1nthb+rnBFuq
         8SFISz+XlKLu3ah1wo5y4Neg9Gg3jpqWLEwXxPACa/EmBRfmSLltFh783OCONaJgVvTZ
         zNLxJRSu5d5yDtzkIh6woqi8oLdLIJLPNje3/+tqWQ2tOkWeT5q3ETYjKjg5SkEzC4TU
         UXpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560605; x=1796165405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MiFlYS5QM/ZCFScVScCG0noWBLQHV/SItrBbHD8+bCs=;
        b=neYw5Gf5qbzRMbe/WR1NMYy4adDR8kVi0gUKQl8/dhJDVioFbprf4ZgYI0+JmUaYqc
         R+zP8dLei1zI8RmpmTaM6jwigVXMHRiR6DbYOtrmcJLUCiGhMMKzjFrIn7FPzkc69oT2
         aPf/I3SgNMjhXGrNYiQ5QXM0l3y0d6L+dm5mvLk6mV0M1QqIBSYSdOFE2fTGowWtNqs/
         zEgBL0mnlKDihp9mI81e6zULK/+OnVlhz2FYFs9iRev7th7s+41amE1Nnqgv6qP3rk8p
         2ilrn4OsvVx+9Qj1UKkHQRbUcqTRgIphGKNp3uGYVv4qPU0RS/I3E2yqxcd4qD57SqSA
         bgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560605; x=1796165405;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MiFlYS5QM/ZCFScVScCG0noWBLQHV/SItrBbHD8+bCs=;
        b=rSyUBAjxlCtEFRZpSFIgG0qH0hjfc/8kkjYUM6qvYj8rlbZkyoqVFWMiSU1feWhc1R
         w4LxNFNrx1+PqvJkVW8NziG6RNYIqKFr8X1ijv/AZJnnQDcQ9ClYa37UIAv40jNDvtqV
         fkktqP3ybl0cnTkixQH1ZEq3fTzwGhDQU6WrKeG6TyQ7rkm44iBElrXPZY0CZV6i2qqV
         ibx8et8J1Fdis1w481mGknz14MYNBTRCBP4kysWlt6vDoVH1WowcpPCIZmrOx1nqyztK
         f+MpIPZdYUnjrH6khAQ3RBEkvZHdZHMlLqBi6sbXsNwOe5vuxIMOQFOdp4a2HvJ9LEy+
         h5Ng==
X-Gm-Message-State: APuU4Z8n1243BJvQ8sIJizIktBFPf7Txe4fufn0DdGsKooP/PDueb1o7
	wIlaSm2DoNfdGmgyFJypUG+POWKxi9acAwiMaw1ZVY6HlrlfzGrv+WK31chPl6k1HzVC3wJWX1E
	jmj9SixKHsCKDDbfV1/OwtJsQVAwxAaAeaT+R
X-Gm-Gg: AZFdTZcHgWOfO0koUkBSuH6HzfL2Rl03jBZVTeGJG9HOcujavHL6o3hwWRrauMDkPFV
	uDlr9DeP2SIVKIYpvm0YfBoS+cLH/Kw0o53jPxUNfyX3oBwzqatFTvK38GB6RmyGeLF+zAqTuIe
	9OMWtYtVpfCd3RQUEZaY7MCiFzDU/VV8g7MRWUXAvU8a3+KgTjSdeaiVwLiIBIoqCtA5PAjJanc
	OdM5cYv30lrSjED4g+hfVT+uxyY6JUeZHsxmoCidC5RBv4bzT5Zgomk/2C6a+Op5a96bbxrq37n
	itX5GihZBe4oT//D1aj5O1qJkxtot1zkUEUpuOjIX5ZIS44IxuElg3G+WVYvKeZmwvtFHaUKC/p
	McrX5yQO9uTagQaerrkZXxYojzUfImafOD1s8D4YXMiNER2xoaWe8ZiAau/TV6X0lhk1SDHaYHG
	He13ZHwiyT6kHaDikuDq7BMa6udDGNKZhXgu56UuLL4cYw2UiB14p9VMiK6p+Pnn0QC/MF6OY=
X-Received: by 2002:a05:6402:2714:b0:6b1:b5b8:b695 with SMTP id
 4fb4d7f45d1cf-6ba37acb287mr14729191a12.0.1795560604654; Tue, 24 Nov 2026
 14:50:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Johan ter Mors <johan.termors@gmail.com>
Date: Tue, 24 Nov 2026 23:49:53 +0100
X-Gm-Features: Aa3M54pWo1u_pFKhzTBiZ7b0_QgMXp23IUVdt0N27L4kGjvEReuI2S3Nj12lTqY
Message-ID: <CAPM+r-+-QVUkh5JmSP-Ud4G0fExM_=dp929NXCBZhqyLbbuX2w@mail.gmail.com>
Subject: =?UTF-8?Q?TCP=3A_RFC_5961_challenge=2DACK_budgeting_and_unpaced_RS?=
	=?UTF-8?Q?T_emission_on_closed_ports_=E2=80=94_lab_measurement_=2B_consistency?=
	=?UTF-8?Q?_question_=286=2E12=2C_loopback=2Donly=29?=
To: netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi netdev,

I am running a defensive-security evaluation of the TCP stack (authorized
lab; all traffic between my own namespaces/loopback, kernels 6.12.117 and
5.10.134). While calibrating the RFC 5961 challenge-ACK mechanism against
a blind-SYN storm, I measured two related behaviors that I would like to
have confirmed as intended, and one consistency question. I do NOT claim
this is a bug, a crash, or a memory-safety issue, and I claim no
exploitability =E2=80=94 this is a measurement and a design-consistency que=
stion.

# Observed (lab measurement, 6.12.117, loopback/netns only)

1. Challenge-ACK levering holds. Under sustained blind-SYN pressure
   (synthetic storm against closed ports, aggregate ~500 pkt/s in the
   calibrated run; levering verified 100% up to the raw-socket EPERM
   gate in the high-rate run), challenge-ACK responses keep arriving =E2=80=
=94
   I could not induce the challenge-ACK latency degradation itself on
   Linux.

2. RST emission on closed ports is effectively unpaced. In the same
   storm, RST levering stayed 100% up to ~230k packets/s (the cap in our
   rig being the raw-socket EPERM gate, not the kernel). This is the
   mirror of FreeBSD, where the challenge-ACK path and the RST path
   share one badport_bandlim(BANDLIM_TCP_RST) budget and the challenge
   latency degrades under blind-SYN pressure (we measured up to 639x
   per-connection median outliers there =E2=80=94 that part is being report=
ed to
   FreeBSD secteam separately under coordinated disclosure).

3. Code observation: tcp_challenge_ack_allowed() implements the per-netns
   random-bucket scheme (net.ipv4.tcp_challenge_ack_limit); I see no
   shared budget between the challenge-ACK path and RST emission on
   closed ports, matching the measurements above.

# Questions

   a. Is the absence of a shared band between challenge-ACK emission and
      RST emission intended policy on Linux (i.e., Linux deliberately
      couples neither to the ICMP/badport-style rate limit the way
      FreeBSD's badport_bandlim() does)?
   b. Paced-mirror experiment: when we pace the RST/challenge offer down
      (7 tiers, 32.6-2086.7 pkt/s), levering is 100% at every tier =E2=80=
=94 the
      same experiment on FreeBSD 14.4 shows a hard plateau (~126-138
      responses/s). Is any pacing/bandlim intended for the unpaced RST
      path, or is "RST levering effectively unlimited by default" the
      documented/expected posture?

Everything needed to re-run is a single C program per experiment (no
external dependencies, loopback-only, ~1 minute per run):
poc_tcp_challenge_budget.c and poc_tcp_rstlad_paced.c; artifacts
(challenge-20261124T175428Z, rstlad-20261124T181803Z) available on
request. No crashes, no memory-safety observations, kernel log clean over
all runs, no traffic to or from any external system. Happy to bisect,
re-run on other versions, or add instrumentation on request.

Thanks,
Johan ter Mors =E2=80=94 independent researcher
