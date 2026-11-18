Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964705;
	b=tW2teiUTMocjvgjzV5HnDdISL+pelD5IuHIHoCom2M7Oo6bpWgaOeQQXr5qWe8wAP3cd
	 BLY2D8TwdjwlLe0Iobq9qPgXnBNpE2X4YuYnsDVSKPbBKggRkwZBAdyWB/7lzxzJVBaWt
	 yd63b4RD4B295FsOczz8rMaIPki9lTR4PlEWKSJJZBnK+nS/U+/S2I3GLKFNDTCjvHh7m
	 FtHwtrOgb8lX16nmbkCr705dL6Z0jtdIUa6Vl8SigHJ/3xLmARYI0c7DnN/xL8pbzBGyg
	 jK5Orvs/H+4Oxx5wcI6TfUfeR9gMIxFAyQcUxvCZNc69n0UF7twQOKGhMVq3a2ZfG7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964705;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=R8q6bgm/ELFOdBBZBoDVeavwWA2zBB+mb4iXfAChBEQ=;
	b=BfXDMvT8CWo4yzrqLpU40J++uMUxMDF1TZentviMKsg+ihqcbYamEtHSXtXzHic+XX1F
	 Zp/0iKRkFYRTtaT6uhULMMvBfza8htZqzVBYkkmCOP4y3HWOvrgekduUsiel59yws+USH
	 gcvjefcs/WKSCcEKFXW40sFiOKD7ERKKV+Eyc5b62c9zb/JR+myGoULw73W0Vs7dSJGSi
	 93SP79DWMIsbCU5fKPdivryAkAerF0WwwLqNu0RN7dvOEm5BvmvBq6DrrthZVFnZSX1rp
	 OLYIVsEkjYqOIW81vNGbyqWP9EjWnNfj8iCqMINEYGOGpr+d+2EbDJnOacLxCdRnzwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B3606A31C;
	Wed, 18 Nov 2026 01:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpsz10t1794964655tabf454fc
X-QQ-Originating-IP: UnQsg3N1AZD/pmDQixE8VaH7T3FcjDTfhNdPug9S/AA=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 09:17:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 753152919533523365
EX-QQ-RecipientCnt: 10
Date: Wed, 18 Nov 2026 09:17:32 +0800
From: Yibo Dong <dong100@mucse.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <1A1D135CCA0CCD0C+20261118011732.GA418924@nic-Precision-5820-Tower>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
 <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>
 <cf674063-6c6f-43f6-a18a-d7ed5bef8a5c@lunn.ch>
 <236B4E2337BC768E+20261117014902.GA205295@nic-Precision-5820-Tower>
 <2ddca58c-608f-4a0f-a26d-df92c2c34c69@lunn.ch>
 <72676011073A7040+20261117025526.GA214154@nic-Precision-5820-Tower>
 <edd0589c-1a48-44a6-ad15-b9133ee4f751@lunn.ch>
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
In-Reply-To: <edd0589c-1a48-44a6-ad15-b9133ee4f751@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NFFdcD2eoy6wiOKGqKfpUUXtBv9pcY6hUlqIRpBHUhSiugncIPsM+NkX
	YWt33Bclan+FoNtkL+GkHL6WNJ+QUs81JJkRYl4BaSl7sEGW/+8yA96dPXcah25CetapKSd
	rGOEBmPqlKbWt6JXPASqWZMG+P7w+7oOyaMUCvQll7+yf3h6WNLhk0BKGA+CWH9vYF50LLj
	GT1/5jpfCSQ9g4dWJrAeALujzcAR9o6dzJBjbP5+5UPBIFIhReYk6ucYUoEUUcEze2PSlYh
	QvBJYF9sT2M9qhlOt83GsfMax6IO5M7cZIhMSJF1/82HqzM47ymAV3wEcDU8dmpvYK0zCZ7
	v4QSiRC7f7OndFVRDEUMIpQlQWMZBKPNGuL6IB48XMSzWtzbvQLMvPtzamlGg18jyEVQQPe
	6f1sQzN0vGipoHuE36YuOpZnFciq65HX39USSU2G44DhsPFmE/+O8EopTTFLM3oOyrBmouK
	WoTp2oy9rLOtCShSQvHrJMHCRgxSFqxeF6avXfbaA9kH1H49ZSifltFHOZHcFt9tXZORhgj
	NQDnuFGiruH53BvhpNcHwRcFZS41hyt8iNhQVJ9d7xi1MJ2kGKjYxLEqswfW07oNcpKirMs
	h13RyQ0E+yoVTvMSidHNUq++0e+WMUB/JDLSgg74r1+Y/1JBAfUpVf+fSkBZIOjJI+7gATk
	CY8awEhbAFfwImKD1hlqRI26gPJAat2IXe4almoo84LwmpnP1xWUV8TueL2U6q5STXij3Ni
	iPqIUzz6zch83yNx9Gf/19W3/UmzA48GklsCpeWqIcAn03kFOoQ+Mh6+Fvr/wXC5BzrpJWb
	4jMYpokWFQz85fpGeFQ3+kWeRe/4I1B5btNgRQhO/C9orJPty/yyMUATMqRZfQIueFELBeC
	s1FSsIPgWI7Q61bDO/vKvzPYq0nU/NDa16iMuo8qK1OetRzs0KdYm30AYYreyCSxvVahtpJ
	iOnK7h7Jiwgj7Qx2iekoTSm9LvhEZXDC/HztKEJsR2zw+rxSPGbjxWmsCfzMpNvajMNE5Gd
	J8cPO/pPVlCrJn0iMP+zEEy9FbFGr8uF3SkkqYVcY7McetXkxchf9P2gqLbJnTCNz7SWNP4
	JNWjICTUpKX
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Tue, Nov 17, 2026 at 02:21:46PM +0100, Andrew Lunn wrote:
> On Tue, Nov 17, 2026 at 10:55:26AM +0800, Yibo Dong wrote:
> > On Tue, Nov 17, 2026 at 02:54:45AM +0100, Andrew Lunn wrote:
> > > On Tue, Nov 17, 2026 at 09:49:02AM +0800, Yibo Dong wrote:
> > > > On Mon, Nov 16, 2026 at 02:18:28PM +0100, Andrew Lunn wrote:
> > > > > > link, speed, duplex and mdix are updated asynchronously by
> > > > > > the mailbox event handler, outside RTNL. link_lock protects these updates
> > > > > > and provides a consistent snapshot in the getter.
> > > > > 
> > > > > O.K, thanks for the explanation.
> > > > > 
> > > > > I removed too much context, so i cannot see here. What about
> > > > > lp_advertising? That also comes from the firmware, reported on link up
> > > > > when autoneg completes.
> > > > > 
> > > > The firmware manages autonegotiation and reports the negotiated speed
> > > > and duplex through mailbox link events. However, the current mailbox
> > > > interface does not expose the link partner's advertisement bitmap.
> > > > 
> > > > Therefore, lp_advertising is currently left zero to indicate that this
> > > > information is unknown to the driver.
> > > > 
> > > > If reporting lp_advertising is must, we would need to add a new
> > > > firmware mailbox command to retrieve the link partner's advertisement,
> > > > or add lp_advertising to link-event mbx alongwith link, speed and
> > > > duplex.
> > > 
> > > It is not a must, but it is useful.
> > > 
> > > Or you can just throw away your firmware, expose the MDIO bus, and let
> > > phylink drive the hardware. Less code, less bugs, more functionality
> > > for free.
> > The GMAC provides MDIO register access, so exposing an MDIO bus is
> > technically possible. However, the firmware currently manages the PHY,
> > and its interface does not provide a PHY ownership handover mechanism.
> > Introducing host-side PHY management would require coordinated firmware
> > and driver changes to avoid independently configuring the same PHY.
> > 
> > In addition, on this SoC, the firmware configures MDI/MDI-X through
> > AXI-mapped control registers driving the PHY's pi_force_mdix_en and
> > pi_force_mdix_mode inputs. This control path is outside the PHY's MDIO
> > register interface.
> > 
> > The firmware also supports link management before the host driver is
> > loaded and while the host is shut down, including wake-up handling.
> > On OCP platforms, it supports preserving the PHY link across driver
> > reloads and host shutdown. These capabilities are already implemented
> > in firmware, although driver support for them is not included in this
> > series. Any future ownership handover would need to preserve them.
> > 
> > Would it be acceptable for this series to retain the firmware-managed
> > PHY design without registering an MDIO bus, and leave lp_advertising
> > zero for now? If a mailbox command is added to expose the link partner's
> > advertisement, we can populate lp_advertising in a follow-up patch.
> 
> You have not implemented anything special, other systems offer the
> same features, using phylink. However, it is fine to implement it all
> your own, rather than reuse existing software. SoC devices tend to
> make use of Linux to do all this, and PCIe devices tend to reinvent
> the wheel and do it in firmware. We are happy either way.
> 
Thanks for the clarification.
>     Andrew
> 
