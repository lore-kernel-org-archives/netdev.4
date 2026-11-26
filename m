Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684465;
	b=OrikMy56Dxc2oTJnVa3xFiN2eipYdo4PQf9QGeJfQkxdVbMSinVWiW0Nv2LwrIV8tRUx
	 LS7DYaFzjCswLr5ABQnql20+TGB6Yml5i9KUGzVBK33D14YcPMKRFjkSh+tV7iaBcJQqG
	 D/kzBl/FVFTR4/gWbDfue1/IKj96WyXzLCZLoG3UqMNAtnv9IAxcwoauNTJQp1xKg9nTM
	 oUf1aQduBEchFugero5sGOqIQp+ofYhktorvNefOsnPcqBKyKqFWs78J0cy5Rag2gI2Sk
	 ACATqnWnuiB80MPl1paTyYuGYDp+dzCutVQ7itv6g7etoOn2lGWhpsHZAN16cvi7inQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684465;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Uv90ZkLhbhexSdeTuLHraZLQFBYDHiLicEO9C0xVaHE=;
	b=oiW71XYjPrOPoZkkjuzvqlH2IHzWCuoKgLM00dtcw1hCQB/pqQ80Pr6LXBZ6pGXntCil
	 Drh8uWUDZAPEegw6kbFWaMycLKCFCPWzB4DlyTbBJpNPaUR6DLahyxM5nxzyu2ntDzIhq
	 pDfv3vJ2HHsgusgwEPbwzKEhT2//3Jf7uoxKQq4vLW194MqvI0B3V/ul1rERDHWypteD1
	 77W4n/BxVrwxhvOFtDcqANE16bCI7ed+2WpGhYY0pP8vgXbKnk5j7DPe/q6x14nTBG5HH
	 XUOuvdL1ZAavl0k6pc0sB+sH7P0NWG90Z4pESDbXJDCBEd/ZtAZ0XXSWzM8eDBuD+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="WhQ/0Pd7";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCA8606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WhQ/0Pd7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795684463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uv90ZkLhbhexSdeTuLHraZLQFBYDHiLicEO9C0xVaHE=;
	b=WhQ/0Pd7NMJbvfRLgo+X5hRfPY6fvgTGc7WEydMn9d411GsTl34vbDZBU5eEFDjeFBaygM
	hMOrZQzYZGV75WUOGVBvsYBQcogWlNZ+reIFZrlC+AHj7t+CLxCm693iLylU4yWlUuxmwr
	XmkGJ3mVhEOFV8h9KmolSRtFQL73fN0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-SRTgTkmRNCiECG4PoQZlmA-1; Thu,
 26 Nov 2026 09:14:19 +0000
X-MC-Unique: SRTgTkmRNCiECG4PoQZlmA-1
X-Mimecast-MFC-AGG-ID: SRTgTkmRNCiECG4PoQZlmA_1795684457
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBF831800549;
	Thu, 26 Nov 2026 09:14:16 +0000 (UTC)
Received: from jbenc-thinkpadp1gen4i.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80C843000229;
	Thu, 26 Nov 2026 09:14:12 +0000 (UTC)
Date: Thu, 26 Nov 2026 10:14:10 +0100
From: Jiri Benc <jbenc@redhat.com>
To: Lin Jiapeng <ljp1205831794@gmail.com>
Cc: aconole@redhat.com, echaudro@redhat.com, i.maximets@ovn.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 dev@openvswitch.org, Lin Jiapeng <jiapenglin@tencent.com>,
 stable@vger.kernel.org, TencentOS Corvus AI <corvus@tencent.com>
Subject: Re: [PATCH net] openvswitch: reject negative L2 length in
 ovs_fragment()
Message-ID: <20261126101410.4a310394@jbenc-thinkpadp1gen4i.rmtcz.csb>
In-Reply-To: <20261126083218.55429-1-ljp1205831794@gmail.com>
References: <20261126083218.55429-1-ljp1205831794@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Thu, 26 Nov 2026 16:31:41 +0800, Lin Jiapeng wrote:
> From: Lin Jiapeng <jiapenglin@tencent.com>
> 
> ovs_fragment() refragments MPLS packets from their inner network header
> and saves the L2 header in a MAX_L2_LEN-byte buffer before fragmenting.
> 
> POP_MPLS can leave inner_network_header behind skb->data. The signed
> offset is then negative and passes the "> MAX_L2_LEN" check, so
> prepare_frag() widens it to 0xfffffffc for memcpy() into l2_data. An
> unprivileged user can trigger this on both IPv4 and IPv6 paths. KASAN
> reports:
>      BUG: KASAN: slab-out-of-bounds in prepare_frag+0x3c2/0x4c0
>      Read of size 4294967292 at addr ff110001059cf044 by task
>      ovs_frag_trigge/132
>      __asan_memcpy+0x23/0x60
>      prepare_frag+0x3c2/0x4c0
>      ovs_fragment+0x578/0x860
> 
> Reject a negative offset together with an oversized one and drop the
> packet through OVS_DROP_FRAG_L2_TOO_LONG. Valid offsets are unchanged.

This was supposed to be fixed by
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=78a86d75a70e1e227711c72865c59b1422d0a5ae

What kernel did you reproduce this on?

 Jiri

