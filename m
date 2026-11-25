Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591346;
	b=U0A/7AWlTCuTfTZu0txY+bZ8buzqTzzPLGC0zVrU0Yoni8bqWm5Qlj4awIaZgoKttQc1
	 PxIr5ckA0xHCQhDGBf2oQJNfN7r1yyMmrYoojp68LqD6ABYi+lsSw5JbvTf4mppIEP1QR
	 UbQp1smkx2MU+bkuQzqfZFNtB8EQu3cVzwtWMmCK9jYeatmnjd3BAcbmjZ0+xHI/vH+hT
	 QmUvqwfMcCs4f9S/rkVxCjDisRN8Hn+/pMFK8PLGlClg0nAZNWhDgGaP9cmwHl7FDkfN7
	 lQR6SxdJnLPt/Pm3CAN8aV96Bo+FjRmk/oYQJIpyfIqsV7DlGZk4iu+KrCUW+Kx3Zdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=A8YWHJiG1dFBKApi6atkgKH4fcG+bMxDeaeH3bqC40E=;
	b=Sl+M8GyKzbxi/XhdyL5ixnvqlXHs/10g29QWDZAh0in3nyci93TXXFBBHggTpT0ZlzBl
	 9kyVTuheup/j2SuaFTzX76e+zilVPsw0+TdPzEkLK1NQcqLv4WC92C4mmgFjldoxQR+qZ
	 kDlzCY9p87JSF2fWSanx7dl7HnehSOL0Cu0kza4VNkXSJKA0YpxQ8v3BLvvQRJ80h86Mw
	 itw8l2TipoE+uZdBmnf3LX4gWlQOgxji/d3CPV2ahHm+0LsjKuxp/RpzR5iemQ1AlK4it
	 7MPsVek6F8O6m7O4NK4DwXcqCU9Wg0EO3MBtBn42r0Ge0hztUTuMVZvUzUkjMZdYGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4DosacG;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BEA606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BEA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4DosacG
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so2442669a12.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591345; x=1796196145; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8YWHJiG1dFBKApi6atkgKH4fcG+bMxDeaeH3bqC40E=;
        b=B4DosacGPy5rJ3rVJkUoO06/qefJUsnywqjoPsz+OwDCE4Kh0kms0gh/katoopEiR2
         TqPb6BuNFe0yutUthc+GkppfhDAwy5iug54Mh2imLNmbtzkoAXDMBxKxeZBWF53Gqprv
         znUZsCQPLIn7MaNMt/n7JrZPJiwkJIryHKueWZhkCR69LCERji9bJbdbqfKvlv+475Xq
         RWWikYI2TkF5HCeUxsXkk7vsHiZ6xrJ005uNQw3LyXQ+Dttdmte4cG1z8YdFH0JUYhzO
         21RY+oC02h4+beAaRYJ9FpFcMdm0TuMBCAl2iype+gUdXoWSoNwkS1YuDTiVFezbfFjF
         cEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591345; x=1796196145;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8YWHJiG1dFBKApi6atkgKH4fcG+bMxDeaeH3bqC40E=;
        b=dVu0RoCi2EJ4ndFjQl04FJndOYT2WQzl9xfZjfE/u6HK8MXarG6ou7cW7wMGt4SjlD
         Wd2gMvxb1NfXDi0YWptlS1d0x2gqONFaKIwO08hpDUMdEvCw1ejrUEAzXGoOZauDpIFW
         CGBhKstnSsdwH5ov6St6cSWIPFEX6FV7UJPXGRodVGWn4OCoeoKCukmZYFix192gWU+H
         wLi4Cj6EjGaxTU2ubY4hI077SGMn6mUF7j870kvshew6IaA18jJFvYOZ8y9UpqbX9FX5
         XaqhesPBDssyWmmE9300eqYQnHdwY8WWJGxeTHMHE82miQog9+hdXbZgOfx8quaUtWmf
         c9Hw==
X-Forwarded-Encrypted: i=1; AL+hErHUsJ5rdC00J3aUy96XfKkzFVYhYbFvRzNg8BiKQeUS1ZYgY9XvAaweJU0g8BdvVYh2C5BAycQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T0TZs6jrOVkoYBXiZBlNLeVrUdtk/q3lBKmBXT6kXMUhokqdj
	xTsz6vlR25LYzu9/y6DeExdEIuLR3vhZaQGypOy52pBI3hycg+lThtkQ
X-Gm-Gg: AZFdTZdVxSGZScLzU0JoMJG5JPl5xKN/QdNXNey0zL8VML5yqhmFxli2glZsdtDTm6U
	OjqvRVaaR/cdbtsAsSWED2RJ0ykr8LLOCBLMKuJPlMFBWKL/RsyXpU1OLjOsTMeT27lOzvQRdG6
	9C5ZG7ixnn5fvcf7Ua5R2YdsVPR6l0YsjzkEQfgc347S0vv+K5vSssHEHUKq3NyVKu6vC981Uxi
	I3KIpaH7BAZsCrctDuBW/0PZtmzoT7EWNY6aKCv6ArrXV0lkXh9pekQbINNH1xJz/ZjFsPjosf4
	dtukcFId9FXttTNnMcS3EJBJPwVgG//2aL4lYdtNgFCleM+83rixKqKbcBhhA1SZ9lcm2Gm52td
	1jaX7m5qeO2JJCJJLqsGA7uc52hCWk6qbDJNM1UNfTyK5MnOMMBtBuJ8I08AaEgm1jQCkrWM+do
	IlLtv9n7kH5HNyiLsMesK2W0eA7YGaI+k9sYPme6pUsq24cVhEZ9Os0uBjUCQpuH0i4Uu4fmSnA
	VBNwcnZrMCIwHfQ3gI2/BeeZX6SnOMi2/t0rqfGW+2JXJp2PlUonZRs29OjmWkaOqBJviIUqQd7
	Qyp54n1V64daPkxOU6uD/0acTbB2Pn5Gq03sraWN+gPXS4OddCTQNOgZ5MWiStem2VK9j1iQcWY
	JxCnIZYSmpOruup7k1f45LAzKWP37gv1Rx+cX
X-Received: by 2002:a17:90b:3b8f:b0:3b3:b36e:8c3d with SMTP id 98e67ed59e1d1-3b41cb466f4mr15056657a91.62.1795591345008;
        Tue, 24 Nov 2026 23:22:25 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm11053284a91.1.2026.11.24.23.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:22:24 -0800 (PST)
From: Qican Ma <goonsomeway@gmail.com>
To: pablo@netfilter.org
Cc: fw@strlen.de, phil@nwl.cc, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH nf v2] netfilter: flowtable: interlock NF_FLOW_TEARDOWN
 with NF_FLOW_PENDING
Date: Wed, 25 Nov 2026 15:22:19 +0800
Message-ID: <179559133958.36524.598452056230313951@gmail.com>
In-Reply-To: <awWMcRVhzciy1gIw@chamomile>
References: <179550685613.38700.16148920957970479663@gmail.com>
 <awWMcRVhzciy1gIw@chamomile>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Pablo,

No - my tree is based on v7.4-rc4 mainline, which does not have
0abb54363974 yet.

I have now stack-tested my patch on top of your commit on net-next:
all hunks apply cleanly, and the two changes complement each other.

Your commit rechecks NF_FLOW_TEARDOWN in the nf_flow_offload_refresh()
caller after nf_flow_offload_work_alloc(). My patch performs the same
check inside nf_flow_offload_work_alloc() for all FLOW_CLS_REPLACE
callers, which covers nf_flow_offload_refresh() and also the
flow_offload_add() path, and bails before the kmalloc.

The other half of my patch adds the GC-side interlock that is still
missing: gc_step() reads NF_FLOW_PENDING at function entry, before
flow_offload_teardown() sets NF_FLOW_TEARDOWN later in the same pass.
Without the barrier the following interleaving still frees the flow via
RCU while a work item is queued on it:

  GC reads PENDING=0 -> refresh sets PENDING and reads TEARDOWN=0 ->
  queues work -> GC sets TEARDOWN -> flow_offload_del()

I will rebase onto net-next with your commit included and send v3.
Your refresh-side check still works as a second-chance bail there, or
it can be folded into the work_alloc-side check - whichever you prefer.

Thanks,
Qican Ma
