Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685664;
	b=20LgFl4xW30uYf2mDANwaHaDh0CwQ7R/RyMKrPJyF6qffkuqjynUcJzcmtNhQZmX8Vwg
	 4NOkv8qwm976GrnXNrSxYiSaSfNjYBCGMb/iQSyaUEniE197gNQK/8DbtHr/hrPs1Ggsi
	 xscTn+uokeSdlLrptph1OQskkCIpdbzxSIg1oEd/F920jZf7ENXP/sfmrk5wfzuN7lGyU
	 ju4pKpOuV65Q0TL5NmdZQTTPOImRhVmdKxq/5dJVgttUiITBk1d71lSxZDZOBshzWovQq
	 upBBWmaDQ8J8KPuRkdiBJBtMPz6CFsCM5GGwTcY6eBYZ0RcL2QI9vu0AdL1Ik5vq8Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=itCjuIfyFywfPE2jt7Ui8jJPSuZ+kYwvFoObcBS2K3k=;
	b=CX2T1TcGs2mzJgkBzhq8JCmnpT1ZsWMMEjujy7yMBfmLv/M/HqVKfEEmZ3cboxvTZdDf
	 Yhon2Co0CWzojEoyStdoafcNbCUaduSgJTN2mfUsvlRdezQW6oQs6jDV2NJI79ui4oBXu
	 La6AXeOxdUss1v+WowPY2//3Q/TQLJW4C1Qb/2RPl7NCWYLgI7ryvOY6ttEdB0ha78aNR
	 TTbmeL5HG5A4sp5aCwr5LRWWhS1t35DZi4M4g2bcwFbsByBayBzEU7IQ6wEGo1GbYqY2j
	 L+W8/cq60bzfLIwhIlORKohA2LHYQsQS8tv+kw3r4KoFMMg8IVZ4Z/+vkpwfOykNwUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJT2XVr9;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21098606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21098606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJT2XVr9
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f03920c4a0so43429205ad.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685663; x=1796290463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=itCjuIfyFywfPE2jt7Ui8jJPSuZ+kYwvFoObcBS2K3k=;
        b=TJT2XVr9pYrgsry0KXz8sbTbk3KWbTZjaSt1O3fjNva0NK6fgS92jZrGLqPa8V2iee
         O019+x4gUEYFnJu8QdCiyv1dc9D7eO5Bm37ME1t6ilEp4obaOkVNV5HekNPdjXQLCHGM
         2ucgwz/nPSBG1uh7yoHmsG9xeof0BVi1lhNaQlE8wF+Xp5CeTETllsLE88oMQ60s49Qz
         4GfAZ0hYYdX7XGZwo1G/4YmCvA5w8N90JrC9UEag5mLA+Y198q0uxuu7FIF245dOxoLx
         UWi3wbJ4WDB/q7v1fPclWNkV9xuVdbGL6gWv5TNsVCAmEqsaKxVWxDhxZjSqcsPstBgH
         yE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685663; x=1796290463;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itCjuIfyFywfPE2jt7Ui8jJPSuZ+kYwvFoObcBS2K3k=;
        b=SY4G45U17Hp2Ya250eZ0pslg/bzaB0MB0tu3yuWctCbc8UeLn2Nppi8zHfs3GS5RlM
         LD3PDsQEDKM1nn+c4gxtXRaKc2mzaHrOWAxDIk7xvQlH8ej7CaVANhi/0/KbGE6MRUH1
         r3edrFYMfx8Ic4zGm8wn6BzatriZ/rplAo45r/7N79xz1UXIfbHd8Of08XMN0UbnQwyj
         g6rF8/IPcFthne8z5yzCR338NRNv3yl6NMYayl7sZx5B/fQgWlCVu8lKEAz+9IobeVTw
         O4YRHF6WoY0r8RF1w3m3TuWeE0P6ebiJgVhj0IG7dp2nHMZQ06xG2tTeAzV3x2SfWlDe
         qAIQ==
X-Forwarded-Encrypted: i=1; AL+hErEEJzCGbRVaPzrgOVKNe9z9aTyeATiOijHUiPaK9TyHf8cBy+WudHm8a0J+WJRZESzidV8Jqg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wPVd3OKsTSRIGlYg9LKuXLiPtn05WlnCS5rNW0soCbhsmfS6F
	LXQgYjSWFi5uU1NE7xotnAuHH2Ga8t2blIn+7Rj4sSSWcbtYt0cNBRVG
X-Gm-Gg: AZFdTZdmSUxZ8icf2ex7Zj6MdWBeE/2l/ZnkN2QqM4outIayKFWzfwCcWKG6gvaOw5i
	9TcXBeHbp0O1Pl5o94OLUaxDPz7Rq1N49uLarkYhsamixfOVad/BbQ6ahHd3EjeUPP1dDIGjwQ2
	YEd3UussIPtjS1OsVO/ccKllDw9rQWo+dfBlNffyX/UFXO+N/5gc762DcgjpNG4VnmRCqtAiT9h
	IKeFEneQagA3uK7HgirBRT+U+s6R9knj/TSsNbvIMdC4bIOp1vIeV5jXXptperQm0Lv7WBiA16O
	tRf5TQOaj2f6/jQrEKFEjzOtHxGvMbrmfO2vXEfOZIeoixazWZ6uO9ZgDwcHj7TUywdXD0KQozW
	Dzdl67JrXTRfgipxpBHKCbatwcaCEgeKpQevMdFWeIcNYqbzKs03MGLPN60htOY8xHtOMnBeDmS
	IjO+nC9PUlp2yrXFRizw4pMht+iDoO7QWql7OUw0xsahsg8inTumuBKTAC/SrYi0otXA8xJTuSt
	S+gF7vN7JZG5CxclSjhdhn5afQYfNdztJ9qs0Hdbbw80FaAqrrkYzarTsnTxEJAz770HLC/TOIr
	fIJnLl7plkSJ5cCdf1ZRXzGUQ7dJyrie043Ry+uEGYnJ4IZNgnV0x1ZJlPTRaedIrxk6UkhLUs+
	x53iMvA==
X-Received: by 2002:a17:902:f645:b0:2ef:dc42:10a9 with SMTP id d9443c01a7336-2f03ef3d32dmr216044935ad.7.1795685663337;
        Thu, 26 Nov 2026 01:34:23 -0800 (PST)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee844acsm103955985ad.2.2026.11.26.01.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:34:22 -0800 (PST)
Message-ID: <5d1f3ff8-b995-4496-a59f-2a01f38603b1@gmail.com>
Date: Thu, 26 Nov 2026 17:34:19 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] openvswitch: reject negative L2 length in
 ovs_fragment()
To: Jiri Benc <jbenc@redhat.com>
Cc: aconole@redhat.com, echaudro@redhat.com, i.maximets@ovn.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 dev@openvswitch.org, Lin Jiapeng <jiapenglin@tencent.com>,
 stable@vger.kernel.org, TencentOS Corvus AI <corvus@tencent.com>
References: <20261126083218.55429-1-ljp1205831794@gmail.com>
 <20261126101410.4a310394@jbenc-thinkpadp1gen4i.rmtcz.csb>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <20261126101410.4a310394@jbenc-thinkpadp1gen4i.rmtcz.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-26 5:14 p.m., Jiri Benc wrote:
> On Thu, 26 Nov 2026 16:31:41 +0800, Lin Jiapeng wrote:
>> From: Lin Jiapeng <jiapenglin@tencent.com>
>> ...
>> Reject a negative offset together with an oversized one and drop the
>> packet through OVS_DROP_FRAG_L2_TOO_LONG. Valid offsets are unchanged.
> 
> This was supposed to be fixed by
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=78a86d75a70e1e227711c72865c59b1422d0a5ae
> 
> What kernel did you reproduce this on?
> 
>   Jiri

Thank you for pointing me to that fix. I reproduced the issue on the 
then-current mainline, commit
4dce97c6c265544342e716e62fd24bbb232590c5, fetched on 2026-11-25.
I also verified that 78a86d75a70e1e227711c72865c59b1422d0a5ae is
already an ancestor of this commit.

You are right that 78a86d75 addresses the original issue. However, it
does not cover this particular variant.

The existing fix is reached through the following POP path:

     do_execute_actions()
       -> pop_mpls()
          -> skb_mpls_pop()
             -> if (!eth_p_mpls(next_proto))
                    skb->inner_protocol = 0;

Thus, when the last POP specifies a non-MPLS next_proto, the stale
inner_protocol state is cleared as intended.

My reproducer instead installs the following action list:

     PUSH_MPLS,
     POP_MPLS(ETH_P_MPLS_UC),
     POP_MPLS(ETH_P_MPLS_UC),
     OUTPUT

This takes a different path:

     PUSH_MPLS
       -> skb_mpls_push()
          -> record inner_network_header and inner_protocol

     POP_MPLS(0x8847) x 2
       -> pop_mpls()
          -> skb_mpls_pop()
             -> advance skb->data by four bytes per POP
             -> !eth_p_mpls(next_proto) is false for both POPs
             -> inner_protocol is not cleared

     OUTPUT
       -> do_output()
          -> ovs_fragment()
             -> skb->network_header = skb->inner_network_header
             -> skb_network_offset(skb) becomes -4
             -> the signed "> MAX_L2_LEN" check does not reject it
          -> prepare_frag()
             -> unsigned int hlen = skb_network_offset(skb)
             -> hlen becomes 0xfffffffc
             -> memcpy(&data->l2_data, skb->data, hlen)

After PUSH_MPLS followed by the two POP_MPLS actions, skb->data is four
bytes past the saved inner_network_header. Because both POP actions
still declare next_proto as MPLS, the clearing condition added by
78a86d75 is never satisfied, even though the label stack has already
been emptied.

This produces the reported KASAN signature:

     BUG: KASAN: slab-out-of-bounds in prepare_frag
     Read of size 4294967292

So this is not a case of the fix being absent from the tested kernel;
rather, the all-MPLS POP sequence described above is not covered by its
clearing condition.
