Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160717;
	b=ecMNxSf4G9uNmJCTc3ujMKfm5k5i4ImYLPDOtw3SpCrjclT3JAe0SVE90xk50F2B7CmD
	 ElHXH+93ArD/gXElur04DJwKb2HMt4DEsD8I/nbQfnrGSCMel7g3jzpjjZkhGqcN3NA5l
	 ofxLitIFAcg45mESIQd8idSHmVmyJ6u1vkgC9tUC4dAZI3srpF9DmfJNaX24N6JkwYyz0
	 mdP7UYiTF8W9Vd1QyqEHCCEGpw8HHOL40fzF8fI7ATK4UCK9xmOdjMaM4UU5QO1unU+1u
	 BDZCegS4DduWrWEd84a0c2MYkdf1Dhfii06KCysod3bI8em/AEEVJhMzimNZk1ZA1kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160717;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=oXQfguT5i+gmjLEy9t2B/GOSyc4K4AwGXiERNNZNpdw=;
	b=OvVLr7LVGspm30B1wUAKFiv40AkoUDEJXlQPC4vjm9KiyyBJmed1a1cy3zfZbv03VW14
	 786xUgCBusMuBnlWcACOORVi9sIDN7txrBIPeUTIyHasrnsP7ZMbhl2w4ijZvQQag/DVG
	 tWBH534r+B7fIv+3kf1ZTIQHtX3AX4o+dlmmRokgUXwSxtQqtrkHQZe/hJmoSfye07qrA
	 Fg6P9TfcxxRnruC2Nv1xQiyap39eTQiBqBC6n4bhTIwygf8x8UaTlklkiVJ/tfRp8JiHf
	 huU0M3L9uO0I1P3G2Gu92mRdfPna5eufVWpXvt7lxFaNtHlo36EGkNADt0OuHb0/yZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sDJoMYXr;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDABE606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDABE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sDJoMYXr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sDJoMYXr0h1fycPakyWbI/7DrXn4rkClzc6Q4isJLdq2xA6b/3kA3jI6x9RD16XKXcc9FCbVQoVd4
	 jm1ox+RjUlhKMjdVOevnhR98NKICzI9O4j4Nhw48LAejZCcbimnGCTVq4Iy23+oOF9AACiIhMa5kqq
	 Anqqt4Jhb0ljrzHk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afffa88ff8-2ba3d;
	Fri, 20 Nov 2026 15:45:12 +0800 (CST)
X-RM-TRANSID:2ee96afffa88ff8-2ba3d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afffa8820d-1c0eb;
	Fri, 20 Nov 2026 15:45:12 +0800 (CST)
X-RM-TRANSID:2ee66afffa8820d-1c0eb
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net] tools: ynl: preserve non-ASCII string attribute bytes
In-Reply-To: <20261110105845.0c9faffb@kernel.org>
References: <20261110033922.49297-1-xujingjing@cmss.chinamobile.com>
 <20261110105845.0c9faffb@kernel.org>
Date: Fri, 20 Nov 2026 07:45:12 -0000
Message-ID: <179516071221.8627.13064755453968362898@cmss.chinamobile.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"

Hi Jakub,

My opening statement was too broad. I inferred a general string contract
from the kernel accepting non-ASCII interface names.

The validation used locally created dummy interfaces in a network
namespace: creating the name succeeded, and the unmodified YNL getlink
dump then raised UnicodeDecodeError. This was a synthetic test case,
not a reported production failure.

That observation does not establish that these names are a supported YNL
requirement. I also overlooked rtnetlink(7)'s description of IFLA_IFNAME
as an asciiz string. It was not sufficient justification for changing
the shared codec for every string attribute.

I will drop this patch. Sorry for the unnecessary review work.

Thanks,
Jingjing


