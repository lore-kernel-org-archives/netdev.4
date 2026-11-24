Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552475;
	b=cV+YPN/fe5ImF/6uLD8Bplu6n1mtI/As5c8jzp3JTPST+CvZW6UPKDs2kH9XpO2LDymb
	 q1bFNg5zeU6wvgNJFwVIxUwkIqZXc5xk2cKEfVUfefb891gRzOc96mu+oxSjKAOxdNUj2
	 8bDClpwDMjacXZwmpibdU80FaVM7ax9Hnvpn/fNxWy2ALywX9i1f04tpfEWnofW3iwESH
	 HUaUhEAs+FLA4CZKgGK9b1VfIWTXnCfcKNP0kFJD7T0s7AwYJ8HFE9DKZRezXNZEHe//l
	 dPRHYh/FkMoZdfID06kb0iEMHuC3n3GfR3sckyqFdibxpoC2z5Yoh85eo5UNEiaM5Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0gGPj4kTELj+B35v7ZlhFCknxenwumFRIKQjKFG/xkU=;
	b=xbzih/IU8GixaBO/PKOT+GVjOzyIO40j3nezCo5jwIu2OD/xroeqUw6SRIRH9swuqZbw
	 xAGrwer+Zvo33ToNph8pW1T1gdwhVbzJr/rgdMNKYg5Ev04QBz80mmN3dXgu2Zec5ZuYW
	 hqFwroRxX9OtaomzWAzg7cPbxE9vOJwNzJy7GA55LcA60cW6IKUu/A8a8rqqOMAowM4rE
	 adE2KDKeyaYucxL9mjf+q8x5XRHxZqWRXQCB6VQwo7MCQHTyCgPJ+cJAFOiomwjiuieam
	 sqcYlpnD9E1ypdOSRF76fL+p4jElJxdGHW5eQEzhGAADn7y2rYGutPBFGlC62Z+Y9nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IWFzJg6x;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576F606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C576F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IWFzJg6x
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1683418b3a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795552474; x=1796157274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gGPj4kTELj+B35v7ZlhFCknxenwumFRIKQjKFG/xkU=;
        b=IWFzJg6xpnqE4fcFC7weA1Yt35QZia/OaODNyYpNfPHlDKe0Py4VliVOwLl30ZXM/Y
         N+YBqMG8efYJZB6sQZYB5qvsE/372NF6ZWJc+K38zWbYDIpeixDJY7E0J3KLm9BOj8hG
         WaKLpRnlE3VQ2Bct0Ay2E9OiYX50z8SfFs5kPD2gwmTnopgePSS7rSSy64a80RZgJqdH
         Zmv4/W4qoZ1rAffs7KAl8Q8ltprdw6EeCJ/ZAoUznQCkqUJo/gzMs9G4tYd0k3KSphVv
         n4W7wLHLm45uGgX1eC0sljKcuI6sFhWrGX3MFAMQgehHHvoY6IfeNWyWy/2r7yCsKbFz
         2+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552474; x=1796157274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gGPj4kTELj+B35v7ZlhFCknxenwumFRIKQjKFG/xkU=;
        b=1PDeMIY1sPZyMJot2ehEN/SIewYENfYkTizolJBNhC9ep1+H/m6E46O2Pf6XP9Jp22
         CeK7GvX9ZAJmlBBfaXgmQ4kwYbdLevaqPOZ3Q92GGi1TJjykzdOK3jdTm8EeD0tyXLak
         ebuVqxDM7BOPaNDxXND02TXBkyqv5lnwakW0lqVYyDlRfRLxUC/B0BjVOub5cRhJczHX
         kQ5QrXHMr4BOh3Q7PvdyPB4syKS6aX6R0iQqy/YJIRE0RaKUoR76NpOHcN4Qy7WcrKu/
         r/bXYrVG0LENRIshf8x/whBCecw56hOFBRMtjuF761E0GxVScjJL/FHf/v3tnEa8Zmqe
         qQ6Q==
X-Forwarded-Encrypted: i=1; AL+hErEtn6e4Zd4uny4n8PkPWWzDSzph+aOwibFGf7CJdxIBIxUAMCG0uFmxmdnvtU4GpeZijjiWoY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OxorSaOevwVkUvwjiVM8Jddsq1SQJQl60ftnIpgi5wQlOnANY
	/abN2hlesuBdZbJXKjNSCKPuM3Urtim7MilnxOn1AtFDhBBUTyQNO+e7x+iLKpmOSbc=
X-Gm-Gg: AZFdTZe0wutXP5KOcKVJU0O170XvgXhtCFehwM0W01ESvBdFoaP4ocF2lGH3xv9JwXL
	R+VQNJF+Sw6uFr2AHksGOzp5lEsLpr/tHLVcdW39yjQffewOQKHswoC9awH5VhQrBeJAHNWWvUN
	HTIR6u1Vb+4XOqIA8RgdixZZS1KI+RmV5Ma7StwSfSsGdIaKjOlWPacl2pYCCGc1bJFzBwfjBNt
	7G3KY3iEznEnRzb9DCWqg8Bk/ZrapI7bqeMbUsQc6zemYSW3Bb06nL8uoFMMHpQRc2W5ugmPTwc
	wJeUMOFKixq2CDnhs7d+gW0aas9/6l74/CtPgrRVSPdNgxV5f8KmxttnVv/c/3Z7ljXSQr8lJLs
	suzAWtlsdmUWhga4L4qiZv/btKxUfZmYLLJ2G4I8N5nH0cC2LP/8p42ZQAln6T7XDUnE/c73SBw
	7Sq/QXANj508Hsn7EdVwjlYYWFEt+BXCL+ABKPbumd/TjJtsYn7xOZaO1JtlLR954QrFUhOpFgf
	fD8cZ482wjvWhKynfQnkX+8eh6fk8qCAE/Eq+dj7UIdSrmJkeYIzLz5CdILsnwLao2qXFQ/BxRq
	PwdMdjEsUS+7wT8od4l+P4VliDiXskeLFEIlnNAbBd4=
X-Received: by 2002:a05:6a00:4518:b0:89e:f2d2:1eab with SMTP id d2e1a72fcca58-8c87cf2a12amr12263594b3a.42.1795552474083;
        Tue, 24 Nov 2026 12:34:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm8048209b3a.36.2026.11.24.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:34:33 -0800 (PST)
Date: Tue, 24 Nov 2026 12:34:31 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Narcisa Vasile <narcisav.kernel@gmail.com>,
	netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Message-ID: <awX01xqN2suPZqE1@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>,
	Narcisa Vasile <narcisav.kernel@gmail.com>,
	netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
 <179499144094.3136.198428718668517773@kernel.org>
 <av/RAwaDfiQnPmbF@gmail.com>
 <20261120154835.0f56c410@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120154835.0f56c410@kernel.org>

On Fri, Nov 20, 2026 at 03:48:35PM -0800, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 20:48:03 -0800 Narcisa Vasile wrote:
> > > [Severity: Medium]
> > > Can this over-count wire packets for GSO skbs that were sent through the
> > > TX push path?
> > > 
> > > This block runs before the is_push early-out. It treats every completed
> > > skb with skb_is_gso() && !is_sw_gso as segmented by the hardware.
> > > However, the push path gate in bnxt_start_xmit() does not exclude GSO
> > > skbs:
> > > 
> > > 	if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
> > > 	    skb_frags_readable(skb) && !lflags) {
> > > 
> > > The push BDs never set TX_BD_FLAGS_LSO or tx_bd_mss, so the NIC sends
> > > the skb as a single frame.
> > > 
> > > Take an idle ring with tx_push_thresh at 164 and a GSO skb of 164 bytes
> > > or less. Two examples are TCP with a peer-advertised MSS of 48 and 96
> > > bytes of payload, or UDP_SEGMENT with gso_size=8 and 80 bytes of
> > > payload. Either skb would be counted as 1 hw_gso_packet plus gso_segs
> > > hw_gso_wire_packets, even though only one frame went on the wire.
> > > 
> > > tso.py reads these counters, so could this give misleading results
> > > there? Fixing the push path issue described below would also fix this.
> > 
> > This couldn't give misleading results there, since no GSO skb in tso.py
> > can be 164 bytes or less, so none can take the push path.
> 
> Fair, but UDP segmentation may sneak in there. I will check with Joe.
> Either way, I agree that this is orthogonal.

I think this is a bug, yea.

I think HW USO can hit it. A small gso_size with UDP_SEGMENT can fit under the
push threshold and that skbw ould go out unsegmented. I think this would
affect Thor2 devices that have HW USO.

I don't think SW USO is affected, though, since it segments before the push
path.

I'm gonna update uso.py to test a small MSS which should trigger this on a
thor2 nic.

Narcisa were you planning to send a fix for this bug? If not, I can, but I
didn't want to step on your toes if you were about to send something :)
