Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285591;
	b=5iDpEo2TPM2tly3c1c2uq60RK2FfrmhYVzwR+SrbaEHm4cXLRBk7soljJ8xko+fb/ZuJ
	 HnhXjmrMb9T4aWaIMgoti3su3njkQf+7i/kf/bh8iLmwLNNRXjKjJAfPr0kFkEgeLrE8Z
	 3aVrRUmb0hJEm/zTGELKv9krHWRIZtaud6LUNjFNRE5o3Tm7bpFogopGoJuEGNwXmzyJb
	 FPAvRR9msDAtEtzTRYeYg4M6wjGVZOZlUg3LFGi1tTw1dhrSKMURxFEdjtQEN/5zuAU1k
	 N19mJY4s92eBvNHdr3TUuWn1mUqWl4A6KpD0W3fiB7ZkstE7WHZl2H6EHc7WzwoYVYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
	b=rI8l7aA4lUGPWh4lApMd8KquFS+XbA27Rhg+Kt1COckTqRuZlobWyg9WUxIb2/ErEmVj
	 RX5lSWvWCs+jh8URAFHIqTIRKLtOhkjuHGxCbI+iPEU/zwwUoirjYBhVZHfB2oZdymOwl
	 p4zWpuuHvgzUfbRNta5kNE/nIiVPSc6eXzO/or9tjhXovejotyugY73dW/MiOZ7RKM+pF
	 F1jtrhmawB7IO8G79ZtueJhDluLzCU8XZ3E1fefvJqyr+I0SIEIE1dwjryVkHlxxXvs4w
	 cZcEpWIQjmmh29eUgF0yYkmlOGmYoxW9hBzFDzdap3qDH2NT5/5iMuWvkfkVeZRwVzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PT9tRHXr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A27B606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A27B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PT9tRHXr
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67db5e13b0cso1766893d50.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:26:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285590; cv=none;
        d=google.com; s=arc-20260327;
        b=USxokIaiY4Mj9QxUbcz1M4Q0Z1NmyF/te/9bGM/EUwpKR2wPGB4prl/paybssvkgEO
         dLUirg37TUlShfoq4j2EmFJoWszspu4tFwlKDa4LTzl4rTxvULXFY3KjpWQLzUgW3zVt
         ah72DfYE1Js2/KUt2ObpUF+KpKKVeHrAvYSdbgXyGWXCAmha0Hj67b3qevBEyF89Z+na
         QVe3af61NMh+S7O83BQ4Yy2QPSzCpKC8T51vv6AbphFuRUDhWak4BvPwX1uPO7tGYD9O
         HchJyjAjJdMOgya/Auqo05Cw9hl+Joi8Xk6N+ucX+A4S7s9O0K3WiKac3cWSBZMCf2Qz
         qBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
        fh=pV6ag7E+em8A+vXckVkHvbe7aLj6keeNX/issxSQE/k=;
        b=A2tHS9R/GvmGvm43bKfQt4IfBIT2hhGMhrX4HnSInL6Z5ICPGttnfr5BySx50XCCYW
         oyjK+B/m5g5kUcakRATDwAel6EhNLPbaggrDu6sOdQXhfpdjEgVgagRdyqBFKcoxBCob
         PRlNoEkDA1D81vt/17GthDiDdc9dNXy2cf9EWgkE2w0MDxzzoHpmGI6xTEPo2g7E1cxq
         nxTEID8sPerPqG0lTTe+B42ZKK4c975P+Bv9tSCmQREwZBVAGyYDwi+jy8gvUm/XZaq4
         Y4LqxladBlLrIOz/YQf/HKfCTYdxn1Sl7kS9h1VYIiIsgqN2ZlHxciXhw8yo9wp7BS/X
         WbRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285590; x=1795890390; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
        b=PT9tRHXr7x7H83fcvieRWtgZstS1pyRyHtdXUNAQLs5Bmk4GCH2oq4T6hSnMh0OmLA
         4BI1AN1z4+tUeXcai8Z9zODYlfPLYCn8yOhF1WkMdsRAhAXzcSNAjbimF4uZBN9fPEVU
         G9FgCmawCLS6nvEU+xq7WVfSXrZ9cfKFEUl4WAcYwo4L6eCZ3oNZKNPbU+HvZXBzP9wh
         HgEGgmT0tGx+964974FzslwpIrpeR1eNylFw4MLf0hD5nYZe/PKVcWZtBpYmfRQS9TqC
         nbkSVNKRbVIaGPZx5tXzcKI6rhjPhaNqlWRYZR5czTFCo6zjJ0PT8jtt2K170dw8Denm
         L2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285590; x=1795890390;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
        b=gISCGYy/XiOoMJiG0bngAsuU+TftDHV86xu2t1WSiamG41hmim4er9amNhiAYDFCKD
         573oJh4X74LsoI5fKC09KVE+iQm3EFMFTgg0kJgg7qESk/A44aEY4nTreQACPs18lOIX
         sq0tydj4KbHYswV3d69wsopAm34QLM5qTa66WoeIcDo1mtFh0Kggsj10kqy6+7i5BNCL
         ZzWBEvCwnu9LtYTF942/Zlb8ahqqDF8ROvAzGeunqtAYiDfzwY1AHS87u0BRtUgk3O46
         KDlnnT/fkg9idlZ4/POo0v4mOkfFrw7W3mZI83Svt0FEhHvqb697dvjT60tbnCB5VHDw
         /3Tw==
X-Forwarded-Encrypted: i=1; AL+hErFBT2x/a7ajI+1ynM9EBiSYGb/WCje5JMvZuCSY8S+qNmjRpS7581iUvGJYxJOp3ZKLH9CiGdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z89vSoBLiBLhHbA1007cmPxf4ckf7L52SlLSl1NtL6QDcAlsEGT
	aBFR1Lr6pjs9DRVLVmAu1EY6VBeWbz8vNTjhrBIrOxrl9jKg/MhWpbUGnPESt2luAwzGUrZhNAH
	qCc7EINlMLLoNKrtLqpNOfULd0704OsY=
X-Gm-Gg: AZFdTZfNJI7lmLBKCkmT0BF1sXLV7B8bjgM/vhDHw8UdhZyBviA/NnsUcE9JEbApUZZ
	gfbNXV0blWC1lkxBDj0tcMOv5+XmVRdAdO6z6P1Tk3Gk+jS4XnojQdzh/2R7HNd+ve8KamN0Bxm
	rgy84i1JtSloTYs2qalRsez/I/UMoVvn4YYnqCnvLiBBSI74VdeTGOD7J0GZFw5JtcSE3jq9scV
	Dhb4fpq1+KUozOENEN8TybtR9S+ZdLRGAHLVYcBXzomB/G1ujIEbfyfmSqV36NlkpOPQGDPCkP3
	y+Va+O7MXM3n+5rGlLTT/b0Jv3COif2vUkgtoJLWkEPUsKZdNZdZWuxKrcMGL+40q/IOt0uc8/4
	UD0Fa5xhW5+2mxm1uH3n/lCxBrdgyiBzlG2VtDVeTaeivhjGhT/0ZuQPmI8hae5P7kbj9zYUA
X-Received: by 2002:a05:690e:1512:b0:67d:eb6d:7451 with SMTP id
 956f58d0204a3-67df4422c68mr2129437d50.33.1795285590320; Sat, 21 Nov 2026
 10:26:30 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <ca39376d-37b6-43e0-9dd5-7d431d335e63@yahoo.com> <1fb7feee-3e4b-4313-a596-29f2ad0de1dc@yahoo.com>
In-Reply-To: <1fb7feee-3e4b-4313-a596-29f2ad0de1dc@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Sat, 21 Nov 2026 15:26:19 -0300
X-Gm-Features: Aa3M54ofyQJPd_0cDwuIs6-tjlhNQxU7Th9d_h6ZqzQRuI8H1WEx1muDgV81y4A
Message-ID: <CAK+kzgwqPfWv6uOPd2SmBZ2dFWp7jTpL1YiQ01Gft+KnZ=gjFA@mail.gmail.com>
Subject: Re: [PATCH net-next v12 12/13] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw,

Tested v13-pre2's port-based FID on a TP-Link EX511 v2 (RTL8367S-VB),
over loopback cables between bridge ports and standalone ports of the
same switch:

- 0x07AC/0x07AD read back as intended: FID 1 on the ports of the
  VLAN-unaware bridge (the uplink included), nothing on the standalone
  ports or the CPU port, nothing in a VLAN-aware bridge, set and
  cleared again by live vlan_filtering toggles, and cleared once the
  ports leave the bridge.
- What failed on v12 with the shared FID 0 now works: unicast between
  two hosts on standalone ports through the VLAN-unaware bridge with
  learning on (also when the bridge ports have a PVID, and with frames
  tagged with a VID the bridge does not have), and static and group
  entries without a VID no longer catch frames arriving on standalone
  ports.
- Everything else gives the same results as on v12.

One limitation remains in VLAN-aware bridges, unchanged from v12 as far
as I can see: a frame tagged with one of the bridge's VIDs that enters
a standalone port is looked up in that VLAN. With VLAN 50 tagged on two
bridge ports and the hosts learned there, the frames that come back in
through the hosts' own standalone ports are sent towards the bridge
ports and dropped by the isolation; with learning off they reach the
CPU. Untagged access VLANs are not affected. This needs the same MAC on
a standalone port and in the bridge, so I think it is only a corner
case.

Family D seems to have a setting for it. The Realtek API in the stock
firmware has dal_rtl8367d_l2_lookupHitIsolationAction_set(), with no
family C counterpart, which writes bit 0 of 0x0A10. The reset value 0
drops a frame whose lookup hits a port outside the ingress port's
isolation mask. I tried two test-only changes on top of v13-pre2:

- 0x0A10 bit 0 set to 1: the case above works (20 of 20 replies), but
  a frame for a host behind the port it came in on is flooded instead
  of dropped, since the ingress port is not in its own mask. A static
  entry or an MDB entry on the ingress port no longer cuts the traffic.
- the same, plus each port in its own isolation mask: the switch still
  never sends a frame back out of its ingress port (I checked that with
  a single loop cable first), the case above works, and the static
  entry and MDB tests pass again.

That was a focused run only: the cabling check, isolation between
standalone ports, the VLAN-aware bridge tests (load included) and
unicast with learning in the VLAN-unaware bridge. If you want to make
this change, I will run the full set of tests on it.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
